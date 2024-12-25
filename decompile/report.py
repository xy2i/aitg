#!/usr/bin/env python3

import os
import re


def main():
    # Directory containing your script files (change if needed)
    scripts_dir = "./scripts/"

    # Regex to match the first line, e.g. "//! status=pending"
    status_pattern = re.compile(r"^//!\s*status\s*=\s*(\w+)", re.IGNORECASE)

    # Store file info in a single list: (filename, line_count, status)
    files_info = []

    # Keep track of total lines by status
    line_counts_by_status = {"pending": 0, "progress": 0, "done": 0}

    # Iterate over files (non-recursive)
    for filename in os.listdir(scripts_dir):
        file_path = os.path.join(scripts_dir, filename)

        # Only process regular files
        if not os.path.isfile(file_path):
            continue

        with open(file_path, "r") as f:
            first_line = f.readline().strip()
            match = status_pattern.match(first_line)

            if match:
                status = match.group(1).lower()  # e.g. "pending", "progress", "done"

                line_count = 0
                for line in f:
                    if line.strip():  # Only count if non-blank
                        line_count += 1

                # Handle unrecognized status as "done", or do something else if you prefer
                if status not in line_counts_by_status:
                    status = "done"

                files_info.append((filename, line_count, status))
                line_counts_by_status[status] += line_count
            else:
                # If there's no status line, skip or set a default status
                # Here we skip, but you could treat as "done" or "pending" if needed.
                pass

    # Generate the HTML report
    generate_html_report(files_info, line_counts_by_status, "report.html")
    print("HTML report generated: report.html")


def generate_html_report(files_info, line_counts_by_status, output_filename):
    """
    Creates an HTML file showing:
      - A summary table of total lines (with percentages) for each status
      - A progress bar reflecting distribution of lines by status
      - A detailed table listing each file, with background color based on status
    """
    total_lines = sum(line_counts_by_status.values())
    if total_lines == 0:
        # Avoid division by zero if no lines are found
        total_lines = 1

    # Calculate percentages
    pending_percent = (line_counts_by_status["pending"] / total_lines) * 100
    progress_percent = (line_counts_by_status["progress"] / total_lines) * 100
    done_percent = (line_counts_by_status["done"] / total_lines) * 100

    # Define background colors for each status (lighter tints to avoid clashing with text)
    status_bg_colors = {
        "pending": "#fff9e6",  # light yellow
        "progress": "#e6f9ff",  # light teal
        "done": "#e6ffe6",  # light green
    }

    html_parts = []
    html_parts.append("<!DOCTYPE html>")
    html_parts.append("<html>")
    html_parts.append("<head>")
    html_parts.append("  <meta charset='utf-8' />")
    html_parts.append("  <title>Scripts Status Report</title>")
    html_parts.append("  <style>")
    html_parts.append("    body { font-family: sans-serif; margin: 20px; }")
    html_parts.append("    table { border-collapse: collapse; margin-bottom: 30px; }")
    html_parts.append("    th, td { border: 1px solid #aaa; padding: 8px; }")
    html_parts.append("    th { background: #f0f0f0; }")
    html_parts.append("    h2, h1 { margin-top: 20px; }")
    html_parts.append("    /* Progress bar styling */")
    html_parts.append(
        "    .progress-container { width: 100%; background: #eee; height: 20px; margin-bottom: 20px; }"
    )
    html_parts.append("    .progress-bar { float: left; height: 100%; }")
    html_parts.append("    .pending-bar { background: #ffc107; }    /* Yellow-ish */")
    html_parts.append(
        "    .progress-bar-ongoing { background: #17a2b8; } /* Teal-ish */"
    )
    html_parts.append("    .done-bar { background: #28a745; }       /* Green */")
    html_parts.append("  </style>")
    html_parts.append("</head>")
    html_parts.append("<body>")
    html_parts.append("  <h1>Scripts Status Report</h1>")

    # 1) Summary table (with percentages)
    html_parts.append("  <table>")
    html_parts.append("    <tr><th>Status</th><th>Total Lines</th></tr>")
    html_parts.append(
        f"    <tr><td>Pending</td>"
        f"<td>{line_counts_by_status['pending']} "
        f"({pending_percent:.2f}%)</td></tr>"
    )
    html_parts.append(
        f"    <tr><td>In progress</td>"
        f"<td>{line_counts_by_status['progress']} "
        f"({progress_percent:.2f}%)</td></tr>"
    )
    html_parts.append(
        f"    <tr><td>Done</td>"
        f"<td>{line_counts_by_status['done']} "
        f"({done_percent:.2f}%)</td></tr>"
    )
    # "Total" row has no percentage because it's always 100%
    html_parts.append(
        f"    <tr><td><strong>Total</strong></td>"
        f"<td><strong>{sum(line_counts_by_status.values())}</strong></td></tr>"
    )
    html_parts.append("  </table>")

    # 2) Progress bar
    html_parts.append("<div class='progress-container'>")
    html_parts.append(
        f"  <div class='progress-bar pending-bar' style='width: {pending_percent}%;'></div>"
    )
    html_parts.append(
        f"  <div class='progress-bar progress-bar-ongoing' style='width: {progress_percent}%;'></div>"
    )
    html_parts.append(
        f"  <div class='progress-bar done-bar' style='width: {done_percent}%;'></div>"
    )
    html_parts.append("</div>")

    # 3) Detailed table listing each file
    # Sort by status (so you see Pending, Progress, Done in groups)
    files_info_sorted = sorted(files_info, key=lambda x: x[2])

    html_parts.append("<table>")
    html_parts.append(
        "  <tr><th>Filename</th><th>Lines of Code</th><th>Status</th></tr>"
    )
    for filename, line_count, status in files_info_sorted:
        bg_color = status_bg_colors.get(
            status, "#ffffff"
        )  # default white if not recognized
        html_parts.append(f"  <tr style='background-color: {bg_color};'>")
        html_parts.append(f"    <td>{filename}</td>")
        html_parts.append(f"    <td>{line_count}</td>")
        html_parts.append(f"    <td>{status.capitalize()}</td>")
        html_parts.append("  </tr>")
    html_parts.append("</table>")

    html_parts.append("</body>")
    html_parts.append("</html>")

    with open(output_filename, "w") as out:
        out.write("\n".join(html_parts))


# Optional: Recursive version
# Uncomment and replace the "for filename in os.listdir(...)" block in main():
#
# import os
# for root, dirs, files in os.walk(scripts_dir):
#     for filename in files:
#         file_path = os.path.join(root, filename)
#         ... (status check and line counting as above) ...


if __name__ == "__main__":
    main()
