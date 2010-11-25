Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PLYob-0000SJ-W8
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:12:34 +0100
Received: by vws6 with SMTP id 6so313518vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 02:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=xIUpHT044VRUjFE9tD8OAybvOEnY29m9Ltr1exO8ef8=;
	b=NjA2Wp1K+WOQHxgzfv1ntPsami+tvBGhlbfuBJY8RJOdLxD1H/x26WmYGc+DlXCoiv
	0efAIKQlJ9jDjv/A4n0aFl8uXLvbvQuG2F9H7MQdCieG8aqgaxtKVz3IHY9scap/I/c4
	DRil0o8VOIkCJKIyufoSGcC4KxzGibrwlFEM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=I5n4Vv520paY82bC2wYYVIpFLNIyV3ePWML6qCU+WnXGA0BAX51xWOortII1k3j0T/
	DDbkkrcN+YE48OajzRgVG9LdRpAfGS8PJTH/HestKPUEUnW8c+c1gKyB+fJstK/JWNM/
	wXoCZzmB0dZBk0kw7w66IMULEMHAxcJ/9kJnE=
Received: by 10.229.251.204 with SMTP id mt12mr521732qcb.182.1290679878031;
	Thu, 25 Nov 2010 02:11:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Thu, 25 Nov 2010 02:10:57 -0800 (PST)
In-Reply-To: <4CEE336E.9070306@eukrea.com>
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
	<4CEE336E.9070306@eukrea.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Thu, 25 Nov 2010 11:10:57 +0100
Message-ID: <AANLkTiktUcmsYsQh-VFJtWTgpyzbQVmLgg7WuxEJkipW@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 10:12:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ok thanks. does some one has a clue ?
extracted for the log :

Fatal error: can't create obj/qwt_abstract_scale_draw.o: No such file
or directory



2010/11/25 Eric B=E9nard <eric@eukrea.com>

> Hi,
>
> On 25/11/2010 10:53, Sylvain Par=E9 wrote:
>
>> http://tinderbox.openembedded.org/packages/1087355/
>>
>> Does some one else has already succeded to build qwt 5.2.1 for X11 ?
>>
>>  only compile tested (angstrom-2010.x, armv6, oe head & bitbake
> parallel-parsing) :
> NOTE: package qwt-5.2.1-r0: task do_compile: Succeeded
> .../...
> NOTE: package qwt-5.2.1-r0: task do_rm_work_all: Succeeded
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

