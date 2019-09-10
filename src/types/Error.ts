export interface ReopenRules {
    reopen_if: string;
    seconds: number;
    occurrences: number;
    hours: number;
    occurrence_threshold: number;
    additional_occurrences: number;
}

export interface CreatedIssue {
    id: string;
    key: string;
    number: number;
    type: string;
    url: string;
}

export interface GroupingFields {
    line_number: string;
    error_class: string;
}

export interface Error {
    severity: string;
    assigned_collaborator_id: string;
    id: string;
    project_id: string;
    url: string;
    project_url: string;
    error_class: string;
    message: string;
    context: string;
    original_severity: string;
    overridden_severity: string;
    events: number;
    events_url: string;
    unthrottled_occurrence_count: number;
    users: number;
    first_seen: Date;
    last_seen: Date;
    first_seen_unfiltered: Date;
    reopen_rules: ReopenRules;
    status: string;
    created_issue: CreatedIssue;
    comment_count: number;
    missing_dsyms: any[];
    release_stages: any[];
    grouping_reason: string;
    grouping_fields: GroupingFields;
}
