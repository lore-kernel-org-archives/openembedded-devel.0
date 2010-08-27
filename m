Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OosD4-0004CJ-9O
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 08:14:42 +0200
Received: by iwn2 with SMTP id 2so2225509iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c+m5Z9ZJUKadRSUm3R9Zz7GgGR0SNUWkRIwpnxizuNw=;
	b=HmhW7Ue84j4CnUs2+k5skwFtVgx61d/MySy9jXVna5s6wn9qBKU68W8O3xMh87KVpq
	r/+9rwr/fLrjvhDitAkTU7hAsr8W7V7nJmRhmb3UM4pU8KzzIfKNC3mHr/X2Idas80b0
	LpcSTrjtQwzg1jlRPWg4mUvXwruIEL68X2ZpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=u1yiF6XKfTLATzN3T/s2J40tSR7TsQk5f6QRLC3AK+PdBCE4/+vZKYx0mYFyExcjlb
	HuFk/UkMcA1OCfpRG8XZ57n/MLUzqa98IsFoZm6acrgzGuUFrmNyIwqJE2/wolWKYNRq
	fxSai1ZrEuB/LNqA6d+bRwMOYu6v1YiJLoVwY=
MIME-Version: 1.0
Received: by 10.231.19.7 with SMTP id y7mr537542iba.152.1282889655169; Thu, 26
	Aug 2010 23:14:15 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 26 Aug 2010 23:14:15 -0700 (PDT)
In-Reply-To: <1282885673-29881-1-git-send-email-khimov@altell.ru>
References: <AANLkTi=C2B9VxaR0EVGWJf-ayoQ12shcvbO_Enp3KbEZ@mail.gmail.com>
	<1282885673-29881-1-git-send-email-khimov@altell.ru>
Date: Fri, 27 Aug 2010 08:14:15 +0200
Message-ID: <AANLkTi=FUJ3YZVoaQQuqzowFwU6CwMGVg1bE2osAKiRr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] MAINTAINERS: add an entry
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Aug 2010 06:14:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/27 Roman I Khimov <khimov@altell.ru>:
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0MAINTAINERS | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 67a65c4..0fad51d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -329,6 +329,14 @@ Recipes: =A0 =A0anthy, nunome, uim*, granule, qpobox=
*, qte-font-unifont*
> =A0Recipes: =A0 =A0qpf-unismall, qpobox, poboxserver, imkit*, scim, zten
> =A0Recipes: =A0 =A0eb*, tomoe, offline-wikipedia
>
> +Person: =A0 =A0 =A0 =A0 =A0 =A0Roman I Khimov
> +Mail: =A0 =A0 =A0khimov@altell.ru
> +Mail: =A0 =A0 =A0roman@khimov.ru
> +Website: =A0 =A0http://roman.khimov.ru
> +Recipes: =A0 =A0clamav, cluster-glue, cluster-resource-agents, conntrack=
-tools
> +Recipes: =A0 =A0ethtool, libhtp, openais, pacemaker, ragel-native, squid
> +Recipes: =A0 =A0squidguard, suricata
> +
> =A0Person: =A0 =A0 Sergey Lapin
> =A0Mail: =A0 =A0 =A0 slapin@ossfans.org
> =A0Machines: =A0 palm*, afeb9260
> --
>
Not sure if a review/submission is needed for this.
I would expect that people with commit access just keep their entry current=
/

But anyway:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


