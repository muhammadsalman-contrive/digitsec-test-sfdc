Scan types covered (PR scan = uploaded code, so IAST/DAST does NOT run; it needs a live org):
SAST      classes/Vuln*.cls, triggers/VulnAccountTrigger.trigger
QUALITY   classes/QualityBadPractices.cls (PMD apex rules)
CONFIG    remoteSiteSettings, cspTrustedSites, corsWhitelistOrigins, connectedApps, sites, settings
3rdParty  staticresources/insecureSocket.js (ws://)
SCA       staticresources/jquery-1.6.1.min.js (old jQuery)
SECRETS   staticresources/leakedSecrets.js (trufflehog; needs credential scanning on)
Upload to the repo root of the PR branch keeping these folder names.
