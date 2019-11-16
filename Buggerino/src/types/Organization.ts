export interface Creator {
    id: string;
    name: string;
    email: string;
}

export interface Organization {
    id: string;
    name: string;
    slug: string;
    creator: Creator;
    collaborators_url: string;
    projects_url: string;
    created_at: Date;
    updated_at: Date;
    auto_upgrade: boolean;
    upgrade_url: string;
    can_start_pro_trial: boolean;
    pro_trial_ends_at: Date;
    pro_trial_feature: boolean;
    billing_emails: string[];
}
