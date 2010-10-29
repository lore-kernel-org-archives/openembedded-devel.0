Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PBmT3-0007K4-7Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 12:45:57 +0200
Received: by iwn42 with SMTP id 42so2898620iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NZeMuv8Y9aC4+6b56y69CekNmB+ufPEYWnzFWaJN0jM=;
	b=xRCpPEYwBnWT3UZnannkqbgQ37FNdnHuOUaaQiw0NHHu0Q0T+5hu8aJUcooLV2yTVY
	NvID19x8lS1zTfvqT10DQ/d2F7T3SbFJsN49t4S0yZkS02Zkg4faR6Eu9nvJaetfoE9k
	L/4xNKEZ6l2bkLuHQ8CFc8xdanNdfUkSNOST8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LNCPv+Im9xFo0YxWe7DnEjZibl7ayB+rWF62uvq/y0HmV5laaB/y6JhFpDMcLoepIu
	hG7VNgQlOIiL3FD/FNAo2LP9deqgDkJWnQ3D0r21beVX2KZ+KP7V0fZi3+GzXtkpN4lr
	tbmXBBZaGBFeUZMne7BQTC4z/mN1D2V4gw/xg=
MIME-Version: 1.0
Received: by 10.231.31.196 with SMTP id z4mr212469ibc.81.1288349108712; Fri,
	29 Oct 2010 03:45:08 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 29 Oct 2010 03:45:08 -0700 (PDT)
In-Reply-To: <1288342969.18134.5.camel@mattotaupa>
References: <1288342969.18134.5.camel@mattotaupa>
Date: Fri, 29 Oct 2010 12:45:08 +0200
Message-ID: <AANLkTi=-YbdMyKZkH47b67=6bRZaXPZ63E9ChxkSbphx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OEDEM 2010: [RFC] useful commit message
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
X-List-Received-Date: Fri, 29 Oct 2010 10:46:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/10/29 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear OE folks,
>
>
> could you please discuss the following proposal.
>
> I would very much like more elaborate commit messages. This is in my
> opinion already demanded by the commit policy [1], but often patch
> submitters, especially those not sending changes to review to the list,
> since they have direct access to the repository, fail to adhere to the
> policy.
>
> The reason is, quite often I do not understand why a change was
> necessary. It would very much help me, if at least the error message was
> pasted to be able to compare with one=92s own error messages and what
> distribution and machine was used to test the recipe.
>
> I added an item to the OEDEM wiki page too [2].
>
>
> Thanks,
>
> Paul
>
>
> [1] http://wiki.openembedded.org/index.php/Commit_Policy
> [2] http://wiki.openembedded.org/index.php?title=3DOedem%2F2010&diff=3D29=
61&oldid=3D2954
>

It has been added to the agenda!
Thanks for bringing up this topic.

Frans


