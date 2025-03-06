# End of Session Documentation Update

It's time to update our documentation before ending this session. This prompt ensures we maintain a complete and up-to-date record of our work across the Neovim ecosystem projects.

## Documentation Update Checklist

1. **Update Project History**
   - Add a new entry to `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-history.md` with today's date and session details
   - Include all significant work completed during this session
   - Organize by key components and achievements
   - Use the format: `## Session: [Date] - [Brief Title]`
   - **IMPORTANT: The main history file keeps only the 10 most recent sessions**
   - Place new entries at the top of the file
   - If there are more than 10 entries after adding yours, move the oldest entry to `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/archives/project-history-archive.md`
   - When archiving, place the entry below the "Last archived" date line and update that date

2. **Update Project Status**
   - Refresh `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md` with current status of affected projects
   - Update "Current Status" sections for any projects worked on
   - Add new "Active Next Steps" based on today's progress

3. **Update Project Tasks**
   - Modify relevant task files in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/` directory
   - Mark completed tasks and update task priority
   - Add new tasks identified during this session
   - Ensure task lists reflect current priorities

4. **Update CLAUDE.md Files**
   - Update CLAUDE.md files for any projects modified during this session
   - Ensure command examples are current and working
   - Update "Current Focus" section to reflect latest priorities

5. **Check Ecosystem Overview**
   - Review `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md` for accuracy
   - Update "Current Priorities" section if priorities have shifted

## Summary Format

Provide a concise report of all documentation updates made (no more than 10 lines) covering:
- Which documents were updated
- Key changes made to each document
- Any new tasks or priorities identified
- Current focus for next session

## Important Notes

1. Never use relative paths - always use full paths
2. Don't lose specialized project-specific information while standardizing
3. Maintain proper chronology in the project history
4. Keep "Current Focus" sections aligned across related documents
5. All dates should be in YYYY-MM-DD format
6. Don't add information from the future (today's date is sufficient)
7. **IMPORTANT HISTORY MANAGEMENT**: 
   - Only keep the 10 most recent entries in project-history.md
   - Archive older entries in the archives/project-history-archive.md file
   - Do not delete entries; move them to the archive instead
   - Update the "Last archived" date when adding to the archive
8. **PRESERVE ALL HISTORICAL RECORDS - THEY ARE VALUABLE CONTEXT**

## Next Steps Prompt

After completing the documentation update, respond with:

""Documentation has been updated to reflect today's progress. We're ready to /compact and continue in a new session. In our next session, we should focus on [brief description of next priority]."

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash
# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md
```

Add a new entry with the following format:

```markdown
### YYYY-MM-DD - end-of-session

- **Task**: Brief description of the documentation updated
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement
```

This data helps us continuously improve our workflow prompts."