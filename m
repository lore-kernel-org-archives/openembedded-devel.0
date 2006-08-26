Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GGw4V-00031F-MT
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 13:11:27 +0200
Received: by py-out-1112.google.com with SMTP id i75so1398437pye
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 04:09:41 -0700 (PDT)
Received: by 10.35.108.12 with SMTP id k12mr7264281pym;
	Sat, 26 Aug 2006 04:09:41 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Sat, 26 Aug 2006 04:09:41 -0700 (PDT)
Message-ID: <74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>
Date: Sat, 26 Aug 2006 13:09:41 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <44EFAE66.2040102@free.fr>
MIME-Version: 1.0
References: <44EFAE66.2040102@free.fr>
Subject: Re: busybox-1.2.1 fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Aug 2006 11:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/26/06, Mohammed Amine SAYA <amine.saya@free.fr> wrote:
> Hi all,
> I am trying to build an opie image but busybox fails.
> I got this :
[...]
> |
> /home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/usr/share/udhcpc:
>
> | default.script
> | mv: cannot overwrite directory

Cannot overwrite directory?
Sounds like a permission problem.
Did you build as root once?
Try to manually rm -rf
/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image

regards
Philipp


