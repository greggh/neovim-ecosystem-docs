
# Monthly Prompt Metrics Review

This prompt guides the process of reviewing and analyzing our prompt effectiveness metrics on a monthly basis, leading to actionable improvements.

## Review Process

### 1. Data Collection and Preparation

Start by gathering all prompt usage data from the most recent month:

```bash

# View the prompt metrics file
cat /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md

```text

## 2. Metrics Analysis

For each prompt, calculate and assess the following metrics from the past month:

### Usage Analysis

- **Total Usage Count**: How many times was the prompt used?
- **Usage Trends**: Is usage increasing, decreasing, or stable compared to previous months?
- **Usage Distribution**: Which prompts are used most/least frequently?

#### Effectiveness Analysis

- **Task Completion Rate**: What percentage of tasks were successfully completed?
- **Time Efficiency**: How much time was saved on average?
- **Error Reduction**: What types of errors were most commonly prevented?
- **User Satisfaction**: What was the average satisfaction rating?

### 3. Insights Generation

For each prompt, answer these key questions:

1. **Strengths**: What aspects of the prompt are working well?
2. **Weaknesses**: What aspects need improvement?
3. **Missing Information**: Is there any information that users frequently need but isn't included?
4. **Clarity Issues**: Are there any sections that are frequently misunderstood?
5. **Relevance**: Is the prompt still relevant to current workflow needs?

### 4. Improvement Planning

Based on the analysis, create an improvement plan:

1. **High-Priority Improvements**: Which prompts need immediate attention?
2. **Enhancement Ideas**: What specific changes would improve effectiveness?
3. **Potential New Prompts**: Are there workflow gaps that need new prompts?
4. **Retirement Candidates**: Are there prompts that should be retired or merged?

## Monthly Report Template

Document the review findings in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/monthly-reviews/YYYY-MM.md`:

```markdown

# Prompt Metrics Review: [Month Year]

## Summary Statistics

| Metric | Value | Change from Last Month |
|--------|-------|-----------------------|
| Total Prompt Uses | [number] | [+/- %] |
| Average Completion Rate | [%] | [+/- %] |
| Average Time Saved | [minutes] | [+/- minutes] |
| Average Satisfaction | [rating] | [+/- rating] |

## Top Performing Prompts

1. [Prompt Name] - [key metrics and strengths]
2. [Prompt Name] - [key metrics and strengths]
3. [Prompt Name] - [key metrics and strengths]

## Improvement Candidates

1. [Prompt Name]
   - Current Issues: [description]
   - Improvement Ideas: [suggestions]
   - Priority: [High/Medium/Low]

1. [Prompt Name]
   - Current Issues: [description]
   - Improvement Ideas: [suggestions]
   - Priority: [High/Medium/Low]

## Planned Actions

1. [Action item with owner and timeline]
2. [Action item with owner and timeline]
3. [Action item with owner and timeline]

## Long-term Trends and Observations

[Analysis of longer-term patterns and strategic implications]

```text

## Implementation Plan

After completing the review:

1. **Update Prompt Files**:

   ```bash
   # Edit prompts that need improvements
   [editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/[prompt-name].md

   # Commit changes
   git -C /home/gregg/Projects/docs add prompts/[prompt-name].md
   git -C /home/gregg/Projects/docs commit -m "Improve [prompt-name] based on metrics review"
   git -C /home/gregg/Projects/docs push origin main
   ```

1. **Reset Metrics for Updated Prompts**:
   - Add a note in the metrics file indicating the prompt was updated
   - Begin collecting new metrics to measure improvement

1. **Create New Prompts** (if needed):

   ```bash
   # Create new prompt file
   [editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/[new-prompt-name].md

   # Add to metrics tracking
   [editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md

   # Commit changes
   git -C /home/gregg/Projects/docs add prompts/[new-prompt-name].md metrics/prompt-metrics.md
   git -C /home/gregg/Projects/docs commit -m "Add new [new-prompt-name] prompt"
   git -C /home/gregg/Projects/docs push origin main
   ```

## Best Practices

- **Be Data-Driven**: Base improvements on actual usage data, not assumptions
- **Prioritize Impact**: Focus on prompts that are frequently used or have low satisfaction
- **Seek Patterns**: Look for common issues across multiple prompts
- **Incremental Improvement**: Prefer small, focused improvements over complete rewrites
- **Test Changes**: Validate improvements before committing
- **Document Rationale**: Record why changes were made for future reference

By conducting regular reviews of prompt effectiveness, we can continuously improve our documentation system and enhance development workflows across our ecosystem projects.

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash

# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md

```text

**IMPORTANT: Always ADD a NEW entry - NEVER edit existing entries - these are historical records!**

Add a new entry at the top of the Detailed Records section with the following format:

```markdown

## YYYY-MM-DD - metrics-review

- **Task**: Brief description of the metrics review conducted
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement

```text

Then update the Summary Statistics table at the top to reflect the averaged metrics across all entries.

This data helps us continuously improve our workflow prompts and track effectiveness over time.

