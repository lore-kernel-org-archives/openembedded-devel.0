Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1N6VMt-00027H-Fy
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 21:25:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 739E658C049
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 15:15:07 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19381-02 for <openembedded-devel@lists.openembedded.org>; 
	Fri,  6 Nov 2009 15:15:07 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 466A357FFB0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 15:15:07 -0500 (EST)
Message-ID: <4AF483CA.9060402@cbnco.com>
Date: Fri, 06 Nov 2009 15:15:06 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
	<1257536522-11924-2-git-send-email-ynezz@true.cz>
In-Reply-To: <1257536522-11924-2-git-send-email-ynezz@true.cz>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux: Linux 2.6.31.5 for IEI Nano GX-466
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
X-List-Received-Date: Fri, 06 Nov 2009 20:25:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Marcin Juszkiewicz had a series of patches to update kernels to the=20
latest stable releases. For example, this one updates 2.6.31:

http://patchwork.openembedded.org/patch/1158/

There were some arguments for and against bumping the package version=20
(i.e. keeping it in linux_2.6.31.bb versus making linux_2.6.31.5.bb) but=20
I don't recall seeing a conclusion. Anyway, I've been using Marcin's=20
2.6.31 patch here.

Mike

Petr =C5=A0tetiar wrote:
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
>  conf/checksums.ini                                 |    4 +
>  .../linux/linux-2.6.31.5/iei-nanogx-466/defconfig  | 1688 ++++++++++++=
++++++++
>  recipes/linux/linux_2.6.31.5.bb                    |   12 +
>  3 files changed, 1704 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/linux-2.6.31.5/iei-nanogx-466/defconf=
ig
>  create mode 100644 recipes/linux/linux_2.6.31.5.bb


