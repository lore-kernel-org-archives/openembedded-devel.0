Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1TaVAe-0000OZ-MF; Mon, 19 Nov 2012 18:30:08 +0100
Received: by mail-yh0-f47.google.com with SMTP id g23so258126yhg.6
	for <multiple recipients>; Mon, 19 Nov 2012 09:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OubPatR6rt/j2QCeptS80XNXxLh2FxrjNSvPC/NrJTg=;
	b=utQXiwsXORBJe7NwsKbKZDdDofsBOqpiA3YSg3iY9AxHHGe4xe0w6xjO67wtDcFH5q
	XQhlrkn0tS/i+nYF/Q3t8GRKTI029o0xS32IkJVIBfCF+XmxcFvrsK0tgl3qk46dc7aZ
	MJyHY8nmx7xPBkl4byik9g0P2RT+4oXi+1xCSuyEnNb4x+I3v3rMn0fbB5ALZX/22jeN
	p9tiD00YanpLlbvgpdOeVc2HQB4tVMEgq/SOOFibs0F2X6qQTtNHurXRmZgcLkGy5hMc
	tKBsZ0orWIpnB+OcNeBegNRX67lHtJh/eQjbx/3hPizxmGlolLY3bDrxQwctd7B6DC2y
	dd/A==
Received: by 10.236.92.6 with SMTP id i6mr12700157yhf.40.1353345365825; Mon,
	19 Nov 2012 09:16:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.147.128.37 with HTTP; Mon, 19 Nov 2012 09:15:35 -0800 (PST)
In-Reply-To: <12301427.Yf0uchSh3U@helios>
References: <12301427.Yf0uchSh3U@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Nov 2012 09:15:35 -0800
Message-ID: <CAMKF1sp0rd5V5dFAX3kmayht9M7iJcEmOQ4QLnurH51q_ZRaaA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] OE-Classic recipe migration status
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
X-List-Received-Date: Mon, 19 Nov 2012 17:30:08 -0000
Content-Type: text/plain; charset=UTF-8

 good work Paul

On Sun, Nov 11, 2012 at 11:11 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

>    1484 other
>     218 BSP
>     211 BugLabs
>     195 libs
>     193 obsolete
>     155 obsolete directory (OE-Classic)
>


I think obsolete can be ignored.


>      136 PERL
>     119 python
>      92 distro
>      89 tasks
>      84 nonworking directory (OE-Classic)
>


non working too.


>      80 GPE
>      79 X11 drivers
>      59 images
>      59 games
>      41 fonts
>      23 security
>      20 in another layer
>      18 pending
>      11 EFL
>

