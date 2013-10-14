Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id 45DF46CE9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:29:30 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5AA4FD482B3;
	Mon, 14 Oct 2013 18:29:26 +0200 (CEST)
Date: Mon, 14 Oct 2013 18:29:24 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: andrea.adami@gmail.com
Message-ID: <20131014182924.53b1297c@e6520eb>
In-Reply-To: <1381765192-3697-1-git-send-email-andrea.adami@gmail.com>
References: <1381765192-3697-1-git-send-email-andrea.adami@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] h3800.conf: fix MACHINE_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 16:29:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

Le Mon, 14 Oct 2013 17:39:52 +0200,
Andrea Adami <andrea.adami@gmail.com> a =E9crit :
>  require conf/machine/h3600.conf
> +MACHINE_FEATURES +=3D "pcmcia bluetooth"

not directly related to your patch, but I have an old H3600 with a
compactflash extension (both covered of dust ;-) : which image would you
recommend to build to test on this PDA ?

Thanks,
Eric

