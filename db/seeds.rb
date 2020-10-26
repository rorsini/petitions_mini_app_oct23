# coding: utf-8

if Rails.env.development?
  AdminUser.create!(
    email: "admin@example.org",
    password: "petitions miniapp",
    password_confirmation: "petitions miniapp"
  )

  Petition.create!(
    title: "Tell HP — Say No to DRM",
    body: "
      <p>
        HP recently activated a secret feature in its Officejet Pro printers (and possibly other models) that causes the printers to refuse to print with third-party or recycled ink cartridges.
      </p>

      <p>
        Please join us in demanding that HP say no to DRM.
      </p>
    ",

    letter: "
      <p>
        Dion Weisler<br />
        President and CEO<br />
        HP Inc.<br />
      </p>

      <p>
        Dear Mr. Weisler,
      </p>

      <p>
        We support EFF’s call on HP to immediately restore the full functionality of its printers. Please promise never again to distribute software that artificially limits your products’ functionality.
      </p>
    "
  )
end
