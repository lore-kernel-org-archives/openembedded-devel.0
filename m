Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id E726C72A78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:40:08 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YnPPN-0000zj-O0 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2015 12:40:01 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 12:40:01 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 12:40:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 29 Apr 2015 12:39:50 +0200
Message-ID: <mhqcdm$gr9$1@ger.gmane.org>
References: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
	<1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
In-Reply-To: <1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
Subject: Re: [oe-classic][PATCH 1/1] README: update for current status of OE-Classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Apr 2015 10:40:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Eggleton schreef op 23-04-15 om 16:59:
> OE-Classic is no longer maintained, so update README and MAINTAINERS 
> accordingly, and just in case someone might miss reading those, add a 
> file clearly spelling it out.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>


> --- MAINTAINERS               | 16 +++------------- README
> | 19 +++++++++++++++++-- THIS_REPO_IS_OBSOLETE.txt |  1 + 3 files
> changed, 21 insertions(+), 15 deletions(-) create mode 100644
> THIS_REPO_IS_OBSOLETE.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS index 2f12832..e88d14b 100644 ---
> a/MAINTAINERS +++ b/MAINTAINERS @@ -1,18 +1,8 @@ OpenEmbedded Maintainers
> List
> 
> -Please put you full name and email-address here for the areas of OE you
> want to support. - -Note: For the hard of thinking, this list is meant to
> remain in alphabetical -order. If you could add yourselves to it in
> alphabetical order that would be -so much easier (sort by firstname).
> Thank you! - -Person:     Real name -Mail:       Mail patches to 
> -Website:    Web-page -Interests:  Areas of interest (e.g. subsystems) 
> -Distros:    Maintained distros -Machines:   Maintained machines 
> -Recipes:    Maintained recipes (should match package names, can include
> wildcards) +WARNING: this repository has been superseded and is no longer
> maintained - +please see README for details. The maintainers list below
> remains for +historical purposes only.
> 
> ----------------------------------------------------------------------------
- -
>
>  diff --git a/README b/README index 1264ca6..778efd9 100644 --- a/README 
> +++ b/README @@ -1,3 +1,18 @@ -This is the OpenEmbedded packages metadata
> repository. +This is the OpenEmbedded Classic (OE-Classic) metadata
> repository. + +WARNING: This version of OpenEmbedded is no longer
> supported or actively +developed - it has been replaced by a new model
> based upon +OpenEmbedded-Core (OE-Core). Users are strongly encouraged to
> migrate +to OE-Core as there will be no further updates to OE-Classic as
> part of +the OpenEmbedded project. + +The OE-Core repository is available
> at: + +  http://cgit.openembedded.org/openembedded-core/ +
> git://git.openembedded.org/openembedded-core + +For further details on
> the differences between OE-Classic and OE-Core, +please see: + +
> http://openembedded.org/wiki/OpenEmbedded-Core
> 
> -See http://openembedded.org diff --git a/THIS_REPO_IS_OBSOLETE.txt
> b/THIS_REPO_IS_OBSOLETE.txt new file mode 100644 index 0000000..a283c1b 
> --- /dev/null +++ b/THIS_REPO_IS_OBSOLETE.txt @@ -0,0 +1 @@ +Superseded
> by openembedded-core - please see the README file for details.
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVQLT2MkyGM64RGpERAsrUAJ4wozsDYG8ErP2WpJHzl2myyN6mQACfbiPY
OgxcjzMaLwbEiV2sFW43UeE=
=5UIC
-----END PGP SIGNATURE-----


