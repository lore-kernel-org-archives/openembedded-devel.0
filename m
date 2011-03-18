Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q0Vgj-0005Ti-JN
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 10:09:41 +0100
Received: by iyb26 with SMTP id 26so3838657iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=VDr/gXxl7POp+KWPpJXnHc9lxBEcPX8lrKgF013yvUk=;
	b=XH6LyOqSXhogUS9LXMhsmmH+r0vMije/johqyzkvRRl2n8c5huUobhdiqVIxIDSaRA
	j0bFmKo2r0rw8ENW9zyH3LuJD1XSacnAslAJch1MjxS1yJeaLWbExREi3K4sjrxpcpof
	rNpHETkCbb8oaRb0GOiabKJePxwdHNyxp+nrw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=F148wNt+Rtezcp5EX3gcS2z6RJiPfZuXTsWBlzAXGlJblkbT0TTebNF67tADf2IISu
	jELiEQn4Y/QYUnZxLmYZ8UnSpAFULA8D3TTsvZBoUTOag+qCb7aO4Imd6M7kkj75LZHg
	/4zFBIn/9l301cVDqWjcXHCUinK7/v2mChHDM=
MIME-Version: 1.0
Received: by 10.231.117.129 with SMTP id r1mr680932ibq.195.1300438900340; Fri,
	18 Mar 2011 02:01:40 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Fri, 18 Mar 2011 02:01:40 -0700 (PDT)
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A505479B8C@eu2-mail.mgc.mentorg.com>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha> <20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>
	<4D8061DE.6030106@gmail.com>
	<AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>
	<20110316080500.GA3414@jama.jama.net>
	<989A078976CDAD4CB2DC976EEF70E2A505479928@eu2-mail.mgc.mentorg.com>
	<989A078976CDAD4CB2DC976EEF70E2A505479ABD@eu2-mail.mgc.mentorg.com>
	<989A078976CDAD4CB2DC976EEF70E2A505479B8C@eu2-mail.mgc.mentorg.com>
Date: Fri, 18 Mar 2011 10:01:40 +0100
Message-ID: <AANLkTin1+BjbYGaeJ77qZhSh667VbNP7C-4LfXz0LZt1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Fri, 18 Mar 2011 09:09:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/18 Ahsan, Noor <Noor_Ahsan@mentor.com>:
> Hello Martin/Frans and Khem,
>
> Any recommendation after following analysis that how should I proceed.
> Should I send the patches to community?
>
> Regards,
> Noor

I think Martin is in a better position to judge this than I am.
Did you also verify that the generated output (the packages and the
contents of the packages) is identical in the python and no-python
case?

Best regards, Frans


