Rails.application.config.session_store :redis_session_store,
  key: '_demo_docusign',
  redis: { url: 'redis://localhost:6379/0' },
  expire_after: 90.minutes,
  same_site: :lax,   # safer for development
  secure: false
