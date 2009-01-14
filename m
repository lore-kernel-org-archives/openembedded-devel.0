Received: from [209.85.217.21] (helo=mail-gx0-f21.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1LNAZw-0003K4-Ef
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 19:35:00 +0100
Received: by gxk14 with SMTP id 14so497197gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 10:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=lmfXg7ikdCLNtrR4Z4ch2OfdiC/wsB7CLv7+6ommv40=;
	b=oVJ9QpjWErhD5wAft/ZCI+QseSpOBuxHNgCUNNdGmymeGbl0xparNlzyNLjpVgBDFr
	VCoIEZhbFV+x4zG+bI8nLUIaWF51ZAYOzUClR3JKudhutJBGDJ1GWqbU3VK27N2JcxSr
	WoTIlCm1xg5v22A6TpiET68x1gFzlvfyw1FlI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=mpbgjnTQW19HdI/8CMy/VGfDdYIds79IdfWXf2QMmS6MiYvttV2x5TUuDJypJ8LKqr
	VXz6DLuENeFjhZ73gMi7SKsFlHrMJFALZgPfPxA+hXp68Q/CjUQVX4iGLXyFe2B7MPt4
	0phf58EnQ1BZMXW+nTaJ0iSg5TtNt/G5vDDdk=
Received: by 10.142.255.14 with SMTP id c14mr125384wfi.91.1231957701796;
	Wed, 14 Jan 2009 10:28:21 -0800 (PST)
Received: by 10.142.127.18 with HTTP; Wed, 14 Jan 2009 10:28:21 -0800 (PST)
Message-ID: <37367b3a0901141028i45b8ef21idda27d307d306d30@mail.gmail.com>
Date: Wed, 14 Jan 2009 18:28:21 +0000
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <37367b3a0901141027h63846cc7u3deeba213f7e15a1@mail.gmail.com>
MIME-Version: 1.0
References: <37367b3a0901141027h63846cc7u3deeba213f7e15a1@mail.gmail.com>
Subject: Re: [PATCH] add imx27ads board
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
X-List-Received-Date: Wed, 14 Jan 2009 18:35:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

sorry, it was to openocd...

On Wed, Jan 14, 2009 at 6:27 PM, Alan Carvalho de Assis
<acassis@gmail.com> wrote:
> I am sending attached the cfg file to initialize the iMX27ADS board.
>
> I hope this time I don't need to edit any makefile in order to copy my
> cfg to right place :-)
>
> Best Regards,
>
> Alan
>


