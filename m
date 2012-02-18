Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RypWi-0001A1-6S
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 20:00:56 +0100
Received: by lahc1 with SMTP id c1so5101632lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2012 10:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.128.230 as permitted sender) client-ip=10.152.128.230; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.128.230 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.128.230])
	by 10.152.128.230 with SMTP id nr6mr10148257lab.27.1329591160454
	(num_hops = 1); Sat, 18 Feb 2012 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=SnZKMKjFZcZ9NZ1AwmNdkHdqq5DNw048XAc4UVhl1f4=;
	b=kCH274pa//cjKWy693/jHE5PcwLzSlXNhyHf9UThMaJqYK9ducR5VDpbwVx0YRKqXI
	Pzpo5brH2CWUdsMEUnVdIlA53Fl7d1P5FFYzrUD3fxB46w/ZpxUg3gNUln6SAvi93cPW
	sDIf8a6P+74Ic1q50U35nxejOexqA6e6QJYTw=
Received: by 10.152.128.230 with SMTP id nr6mr8480596lab.27.1329591160389;
	Sat, 18 Feb 2012 10:52:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.111.225 with HTTP; Sat, 18 Feb 2012 10:52:10 -0800 (PST)
In-Reply-To: <4F3EED56.3080400@palm.com>
References: <4F3EED56.3080400@palm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Feb 2012 10:52:10 -0800
Message-ID: <CAMKF1sovCqJL3MNOSKJ_m+kPSHQtb7PGoXhF=EtDFDTrjDmdOg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: runqemu?
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
X-List-Received-Date: Sat, 18 Feb 2012 19:00:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 17, 2012 at 4:14 PM, Rich Pixley <rich.pixley@palm.com> wrote:
> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qemu

what does

ldd  /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qemu

say ?


