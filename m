Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGArR-0007ET-EN
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:41:45 +0200
Received: by vcbf1 with SMTP id f1so559193vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=6JswgDUSIT/HaRYRqvYhGVzTIzCPKhlqJj6i6735VTs=;
	b=m0etWcMb6hq0Q+sMTlm8LgkUgzWDWHmxQfsb0LwRHJ8hkGCHIlq5/HfxlMNVTvW2GC
	qNkwvtk04rSdrff7tfwyUbbhjdr+9go1kaLUTLlbkDydrAFZUC6q9dtO9/Y9TXBDM/o3
	zHKKGGM+zuO1j7dBXbM83nxRnAcHZ/EOee0SQ=
Received: by 10.68.20.41 with SMTP id k9mr5292719pbe.90.1318948554619;
	Tue, 18 Oct 2011 07:35:54 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id ko15sm7916690pbb.9.2011.10.18.07.35.48
	(version=SSLv3 cipher=OTHER); Tue, 18 Oct 2011 07:35:53 -0700 (PDT)
Message-ID: <4E9D8EC0.4030409@gmail.com>
Date: Tue, 18 Oct 2011 07:35:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9D3640.9070608@telia.com>
In-Reply-To: <4E9D3640.9070608@telia.com>
Subject: Re: Use of stamps in the source directory of openembedded-core
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
X-List-Received-Date: Tue, 18 Oct 2011 14:41:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 1:18 AM, Ulf Samuelsson wrote:
> After I have built openembedded-core, I notice that the source directory
> is loaded with files: *.done.
>

they indicate successful download of a source tar.

> Is this really a good idea?
>
> I tend to use a common source directory for multiple projects.
>
> Having stamps in the source directory, means that you let one
> project affect the others.
>



