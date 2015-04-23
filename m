Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 40B2B6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:17:27 +0000 (UTC)
Received: by widdi4 with SMTP id di4so96334276wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=/AfipDPY21b1H+EmuylM3zqOYzlnLK4YZ79OgopPx4g=;
	b=Otpt0KjmtW7oN3TqCK1Rz49hhq7MmmNrCuCRI+CMBTVsGGxagVAR7HkNAvRROKXySp
	ayqL1T1vb07BLBLxIqxvCZwiYvm5KOliQBxdk59jkmNlzFpM2djTakqBJzyqkGJu2f9e
	uC7w2al/1H+FbWdZev8C/ekyphexhXINOSFAkRZuEiq1sKhHCdf5asttQDIg5wwhxU6a
	7CSdKf/y7V09Hk6WmGOFBGR7QQ3jl3WgmbmNhV7T7zz3Cwv9WFCkVFthqteg8TODXUo8
	QsM91+0D2VzBsqCOR1sL0Sz6eCkJYBeoMIbtMOHTq78781W2LqS1azJ8I47dbBgpFsmi
	FaFA==
X-Received: by 10.195.11.202 with SMTP id ek10mr6323579wjd.12.1429802248838;
	Thu, 23 Apr 2015 08:17:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id h5sm12575856wjn.20.2015.04.23.08.17.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 08:17:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Apr 2015 17:17:41 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150423151741.GC2336@jama>
References: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
	<1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 23 Apr 2015 15:17:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 03:59:32PM +0100, Paul Eggleton wrote:
> OE-Classic is no longer maintained, so update README and MAINTAINERS
> accordingly, and just in case someone might miss reading those, add a
> file clearly spelling it out.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  MAINTAINERS               | 16 +++-------------
>  README                    | 19 +++++++++++++++++--
>  THIS_REPO_IS_OBSOLETE.txt |  1 +
>  3 files changed, 21 insertions(+), 15 deletions(-)
>  create mode 100644 THIS_REPO_IS_OBSOLETE.txt
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f12832..e88d14b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1,18 +1,8 @@
>  OpenEmbedded Maintainers List
> =20
> -Please put you full name and email-address here for the areas of OE you =
want to support.
> -
> -Note: For the hard of thinking, this list is meant to remain in alphabet=
ical
> -order. If you could add yourselves to it in alphabetical order that woul=
d be
> -so much easier (sort by firstname). Thank you!
> -
> -Person:     Real name
> -Mail:       Mail patches to
> -Website:    Web-page
> -Interests:  Areas of interest (e.g. subsystems)
> -Distros:    Maintained distros
> -Machines:   Maintained machines
> -Recipes:    Maintained recipes (should match package names, can include =
wildcards)
> +WARNING: this repository has been superseded and is no longer maintained=
 -
> +please see README for details. The maintainers list below remains for
> +historical purposes only.
> =20
>  ------------------------------------------------------------------------=
-----
> =20
> diff --git a/README b/README
> index 1264ca6..778efd9 100644
> --- a/README
> +++ b/README
> @@ -1,3 +1,18 @@
> -This is the OpenEmbedded packages metadata repository.
> +This is the OpenEmbedded Classic (OE-Classic) metadata repository.
> +
> +WARNING: This version of OpenEmbedded is no longer supported or actively
> +developed - it has been replaced by a new model based upon
> +OpenEmbedded-Core (OE-Core). Users are strongly encouraged to migrate
> +to OE-Core as there will be no further updates to OE-Classic as part of
> +the OpenEmbedded project.
> +
> +The OE-Core repository is available at:
> +
> +  http://cgit.openembedded.org/openembedded-core/
> +  git://git.openembedded.org/openembedded-core
> +
> +For further details on the differences between OE-Classic and OE-Core,
> +please see:
> +
> +  http://openembedded.org/wiki/OpenEmbedded-Core
> =20
> -See http://openembedded.org
> diff --git a/THIS_REPO_IS_OBSOLETE.txt b/THIS_REPO_IS_OBSOLETE.txt
> new file mode 100644
> index 0000000..a283c1b
> --- /dev/null
> +++ b/THIS_REPO_IS_OBSOLETE.txt
> @@ -0,0 +1 @@
> +Superseded by openembedded-core - please see the README file for details.
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

