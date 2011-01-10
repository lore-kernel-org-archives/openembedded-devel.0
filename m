Received: from moutng.kundenserver.de ([212.227.17.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Dirk@Opfer-Online.de>) id 1PcP7R-0000iV-Fp
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:17:37 +0100
Received: from mail.opfer.lan (do13.in-dsl.de [217.197.85.204])
	by mrelayeu.kundenserver.de (node=mreu0) with ESMTP (Nemesis)
	id 0M0vAh-1QRLat06ud-00v9gQ; Mon, 10 Jan 2011 22:12:04 +0100
Received: from [192.168.2.47] by mail.opfer.lan with esmtpa (Exim 4.69)
	(envelope-from <Dirk@Opfer-Online.de>) id 1PcP1n-0003UN-HI
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:12:03 +0100
Date: Mon, 10 Jan 2011 22:11:09 +0100
From: Dirk Opfer <Dirk@Opfer-Online.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294585014.4036.47.camel@mattotaupa>	 <4D29FC65.9010608@gmail.com>
	<1294659553.4342.69.camel@mattotaupa>	
	<4D2B0D23.4070003@nospam.arcornews.de>
	<1294670726.4342.72.camel@mattotaupa>
In-Reply-To: <1294670726.4342.72.camel@mattotaupa>
X-Scan-Signature: 63ec99d26c1cf44ba0c8869f7adb0932
X-Spam-Score: -3.8 (---)
Message-Id: <0M0vAh-1QRLat06ud-00v9gQ@mrelayeu.kundenserver.de>
X-Provags-ID: V02:K0:WsLoHmom9beMcSWQLaiewzsbdpcNwRjDllxUrs3Xp8T
	D4shOdvW6moM79FsSlzDZbz8o4vIiTsPBAomtT1kzhtk2gtB1y
	lShuDL112efUoTZyhm9TgoTjHy3EpJfEOWO6xr3fq+n3r1Rheq
	D+VaRO53Y6GSPe7h+/l+VXKgYYIgFRRqOjdA9LzoHa68ll/Xw4
	qpCRXwtIVoMMEIizgk1AhPhaymlwcVadeJpiJP5MpM=
Subject: Re: [PATCH] libcap, libcap2: use automatic packaging to fix QA errors
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
X-List-Received-Date: Mon, 10 Jan 2011 21:17:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.01.2011 15:45, schrieb Paul Menzel:
> Maybe you want to look deeper into the history of that file.  Sorry.
> It looks Dirk committed these lines when adding 1.10 in commit b823b4
> [1].
>
> Dirk, could you please comment on [2].
>

No idea why this was needed in the old version.
Looks fine to me.

Acked-by: Dirk Opfer <dirk@do13.de>

Thanks,

Dirk


