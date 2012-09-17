Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TDbL9-0005Cu-WA
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:26:20 +0200
Received: by pbcwy7 with SMTP id wy7so8808813pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=CQHcId2sSI4eY6YNyLcO+F0j1JHRapYRTrrSJCMywok=;
	b=NXIH5R6N8gRDLNkrEW92J3pSdYVSUOgyH/v9g2S/6UgtN4E/D7TBn/NXcpHJC3aRG6
	4OpV4jvY/oAh6S9Bj2H4RtUhsB0i1dgDNjqZ4aiROF0REb1TKFywRmf5hRURB/dyEG7T
	UgAVr+DqTO2jW5chITg92wbCa6DMrtnAyQioy+ytZbpVIk8/qmZIyCOe3Z0HAs4QiWYo
	/QWeXvCqAc6OHNukzzjMwpw2tOShKveC1eT1USSbUE5iAj7E8BhGQFTo7Idwz1/mMTdX
	hVrrg50YJjEpv5+xvWUMP37UwUKRtcKbsWCTnsJI05SEFhifFjfkuCSkhn4ge4EbwoFi
	A8XQ==
MIME-Version: 1.0
Received: by 10.68.218.72 with SMTP id pe8mr23070701pbc.33.1347887620305; Mon,
	17 Sep 2012 06:13:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Mon, 17 Sep 2012 06:13:40 -0700 (PDT)
In-Reply-To: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
References: <1347879491-2425-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 17 Sep 2012 10:13:40 -0300
X-Google-Sender-Auth: 3ycg4ZgKlgY7Wd2BxBp0AF7-WdA
Message-ID: <CAP9ODKr6hWv7ED5YWxX1vbouE3C-NSySoKxi=7FOW_J-xoFS_g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [for-denzil][systemd update 0/6] Systemd updates
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
X-List-Received-Date: Mon, 17 Sep 2012 13:26:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 17, 2012 at 7:58 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> A big update to systemd v189. Runtime tested on angstrom.
>
> This patchset depends on the bluez updates sent to the oe-core list since bluez uses a deprecated udev API that went away somewhere in between 182 and 189.

This is a too big update for a stable branch in my point of view.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


