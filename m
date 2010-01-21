Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NXwoX-0005rA-Vv
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 14:11:13 +0100
Received: by pwi4 with SMTP id 4so3841600pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Rdq3UnJ5KLCbvfERmkZOaCJzqdOp4LI95+yrlOsF+o4=;
	b=oRUSBJhue5+Qd2LVt2VafbOnVO8WGKkZXH7Bb0vZ22579BHPAaFUxwZUSBkjN9KuQU
	hMAoyTZFlMkMnuPCTTOqEhRKvr0RKgwCZ6Vy9yQk4Y41uxGyCtZ46vOAVaji9hehAzf5
	CpTij3GFlTL2tAVi8XKYRJV87ZVUQ0auNKf/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=rW95XqWrCXW7lrHgS8coK5yBhMZbf1Epa/U8M3pt1081bEe3XEHHX1jT1UP+CqgeDc
	JFWR1XqZsKvyf4PLgIh31sLF+EZVRQfkIbx14Jl/gW57GZlMjSAR86gz7mSzM7+8iQXY
	QliCkQZpQx2tN6SmUnty4bYlzyj76RfFgzprQ=
Received: by 10.140.57.15 with SMTP id f15mr995468rva.262.1264079332104;
	Thu, 21 Jan 2010 05:08:52 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.209])
	by mx.google.com with ESMTPS id 22sm1060485pzk.14.2010.01.21.05.08.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 05:08:51 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1263733818-32111-1-git-send-email-camelguo@gmail.com>
	<1264077708.9743.181.camel@mill.internal.reciva.com>
Date: Thu, 21 Jan 2010 21:08:40 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6vv4qbrmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1264077708.9743.181.camel@mill.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Thu, 21 Jan 2010 13:11:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Glad to hear that  :)

=E5=9C=A8 Thu, 21 Jan 2010 20:41:48 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Sun, 2010-01-17 at 21:10 +0800, Guo Hongruan wrote:
>> * the preferred version of binutils of conf/distro/micro.conf is 2.19=
.51
>> * the preferred version of glibc is 2.6.1 which is defined in  =

>> sane-toolchain.inc
>> * the ld produced by binutils-2.19.51 reports that it can not find th=
e  =

>> __begin symbol when linking with glibc-2.6.1
>>
>> Signed-off-by: Guo Hongruan <camelguo@gmail.com>
>
> Thanks.  I checked this in.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


