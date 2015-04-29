Return-Path: <andrea.adami@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id A37927382F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2015 06:59:30 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so109351567igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 23:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=C3bNNaYAxQynf2rI8kHehxlq3Ash3cr05WQlUpalfqg=;
	b=IsqEDRLfDxPajZZ34mkOEFyuUJxfae7BkGKqQ4hD8SU5Of7oNugYY2hXMQkG1P5GVu
	17guXojRqBgG5t3wjxoBWlsS6LMloYSob180h0GBhPMVEicMFxKVDSscWsUCI0f2kI4k
	PY8aRkqwNdgJKyrPWr+WL+ow2GrmeLCEXsbisvo6YCjyzyauh6kyfRV+sUesaXyGrka6
	DSZBEWBomWG8iDUNsKi9aYFtGDea5B32BNEafkwL90ta2rq6UNtHNWMNQ6TSJGv565JS
	WcWyD1FHDItxoyJfdAhveHENevh5ktydUEF8M7LG3moqWh/SjTOnQVV5fZBMTzoMuVJO
	ZZDQ==
MIME-Version: 1.0
X-Received: by 10.50.25.225 with SMTP id f1mr2203204igg.29.1430290771061; Tue,
	28 Apr 2015 23:59:31 -0700 (PDT)
Received: by 10.36.70.9 with HTTP; Tue, 28 Apr 2015 23:59:31 -0700 (PDT)
In-Reply-To: <1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
References: <1429801172-30602-1-git-send-email-paul.eggleton@linux.intel.com>
	<1429801172-30602-2-git-send-email-paul.eggleton@linux.intel.com>
Date: Wed, 29 Apr 2015 08:59:31 +0200
Message-ID: <CAAQYJAsMEx1k6y-ouUYvprY-MGy_spGd9T7qK9xj0SOhzHbj3A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 29 Apr 2015 06:59:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 23, 2015 at 4:59 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> OE-Classic is no longer maintained, so update README and MAINTAINERS
> accordingly, and just in case someone might miss reading those, add a
> file clearly spelling it out.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>


> ---
>  MAINTAINERS               | 16 +++-------------
>  README                    | 19 +++++++++++++++++--
>  THIS_REPO_IS_OBSOLETE.txt |  1 +
>  3 files changed, 21 insertions(+), 15 deletions(-)
>  create mode 100644 THIS_REPO_IS_OBSOLETE.txt
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f12832..e88d14b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1,18 +1,8 @@
>  OpenEmbedded Maintainers List
>
> -Please put you full name and email-address here for the areas of OE you
> want to support.
> -
> -Note: For the hard of thinking, this list is meant to remain in
> alphabetical
> -order. If you could add yourselves to it in alphabetical order that would
> be
> -so much easier (sort by firstname). Thank you!
> -
> -Person:     Real name
> -Mail:       Mail patches to
> -Website:    Web-page
> -Interests:  Areas of interest (e.g. subsystems)
> -Distros:    Maintained distros
> -Machines:   Maintained machines
> -Recipes:    Maintained recipes (should match package names, can include
> wildcards)
> +WARNING: this repository has been superseded and is no longer maintained -
> +please see README for details. The maintainers list below remains for
> +historical purposes only.
>
>
>  -----------------------------------------------------------------------------
>
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
>
> -See http://openembedded.org
> diff --git a/THIS_REPO_IS_OBSOLETE.txt b/THIS_REPO_IS_OBSOLETE.txt
> new file mode 100644
> index 0000000..a283c1b
> --- /dev/null
> +++ b/THIS_REPO_IS_OBSOLETE.txt
> @@ -0,0 +1 @@
> +Superseded by openembedded-core - please see the README file for details.
> --
> 2.1.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

