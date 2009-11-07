Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6hmd-0003OB-71
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 10:40:38 +0100
Received: by ywh7 with SMTP id 7so1594294ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 01:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=fEDih4zkCVJV6Y0+rBMpwflH48lr7mz7LDpeDSrR+tU=;
	b=YuzvbgGm5lzq0Mp2A+1N0QIvL3L++gt8qNN8EdoQuJFqfh2voIYUnXgZj1ZeKa1YXF
	DKrh7an6huZkqUjN1xNSb+kvaMMhQZsRzmuFy6PVr/4ywZL7Gl5MPtLHQBu9RESvmy19
	dCc+Li3wP1cwNI6woowo8F5HH3yfkDpu/lUBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hRlF903opIEIsuDZeTs0hmF4P3d0o/tnMv1g06vI+a4JalnbZwRGuDAc3jtaVCgc9e
	egKoYbMintwQ3Lh+EuwpyQAtLM98q2YCdii3Vjl42hKOHRQkkJFdWVjdNUW6cTdyA8QI
	N5RC7FtYXh7T9Z6sgqp2ijWQgKq6UFSG59h80=
MIME-Version: 1.0
Received: by 10.100.200.14 with SMTP id x14mr5619661anf.52.1257586758253; Sat, 
	07 Nov 2009 01:39:18 -0800 (PST)
In-Reply-To: <200911071010.46100.holger+oe@freyther.de>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
	<ac9c93b10911070106n587495a5qaf3cfc9288df7e8@mail.gmail.com>
	<200911071010.46100.holger+oe@freyther.de>
Date: Sat, 7 Nov 2009 10:39:18 +0100
Message-ID: <ac9c93b10911070139n6e4bba4ew3a3bb49f36cff7a3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 09:40:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/7 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> On Saturday 07 November 2009 10:06:57 Frans Meulenbroeks wrote:
>
>> > Check the angstrom mirror or sources.oe.org and download that version
>> > and then diff it.
>>
>> Hm. Did that.
>> Apparently version control is not very strong for Twig.
>> The diff for the changes file:
>
> bump the PR of the package too

Of course.
Forgot to do it, done now. Thanks.

Frans


