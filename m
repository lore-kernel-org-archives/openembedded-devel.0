Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbfAA-0004jH-Ji
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 23:50:10 +0200
Received: by eaal1 with SMTP id l1so1321036eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6T17Xpqt12AiuY9L/Wp3UwfyPSz6NGZ9OWF7MR9DBZA=;
	b=K3q8ioJ+Pz7LoqVYgfPk2T/NDUWP/PONKaL3YE2g2OkSi+Toadeep0v7g2CAO8TmqM
	qZcDHewPFuyi1pAmu4rh53XMd79cpD5TVwilKd935iozMqsQ1W3FW/C+kDxG7Uap+WYi
	80fwkTOi+FHLdwyRNCWX22cNjtNjaDkMzVb6ZgfppQW0Jk0jA2MyjrfSIPH2Wgqjz2d9
	GplY6IPuh6OMpEsDY69PnM6ZbX+tLKf+cjuqsmAHyr9gNlXRv88iiYTAHnBu+i/POOgC
	apTmw7sqOfQSBLSBIJuNPnD1PgJehv40vvdr/h1AmyC4zn36uziSf+p31Vg9BdG/eHyN
	kjmQ==
Received: by 10.14.97.135 with SMTP id t7mr5839067eef.177.1338845985490; Mon,
	04 Jun 2012 14:39:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 4 Jun 2012 14:39:14 -0700 (PDT)
In-Reply-To: <9496B4CA-EB17-4618-8711-09ED61FF6A3D@gmail.com>
References: <D40848EB-C66A-47B6-B3C0-CF743A8E032A@gmail.com>
	<CAMKF1srC1uxpT1+Z_LqRUagFhxStZb30ZU10wrRtAReSSR7_zg@mail.gmail.com>
	<77A5818E-F77E-4215-939B-882BC738EB65@gmail.com>
	<CAMKF1spRxzbVgiSev063fjBnPfurPAs45crPXq6kogZP8QuQYQ@mail.gmail.com>
	<9496B4CA-EB17-4618-8711-09ED61FF6A3D@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 14:39:14 -0700
Message-ID: <CAMKF1so-pg2FzqNOVpgUd-Jdf4SgLo5v6fUyQ_AZLk-RHoQ53A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Understanding what qemuppc emulates and getting it to emulate a ppc440 CPU
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
X-List-Received-Date: Mon, 04 Jun 2012 21:50:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 4, 2012 at 11:55 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> Is it possible to use uImage-virtex5.bin for the kernel image and core-image-minimal-virtex5.tar.gz as the kernel image and rootfilesystem, instead of vmlinux-qemuppc.bin and core-image-sato-qemuppc.ext3 ?

it should be.


