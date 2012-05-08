Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SRmGX-0004qv-0g
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 17:23:53 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 9CA22A6269
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2012 17:13:58 +0200 (CEST)
Date: Tue, 8 May 2012 17:13:57 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120508171357.36ca109f@eb-e6520>
In-Reply-To: <CAOHjBZud0iQwc+FUQSkzxkVVWhZwgbCowNw8KSscOxtHmFcE0g@mail.gmail.com>
References: <CAOHjBZud0iQwc+FUQSkzxkVVWhZwgbCowNw8KSscOxtHmFcE0g@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-core] How to produce toolchain sdk
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
X-List-Received-Date: Tue, 08 May 2012 15:23:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Giuseppe,

Le Tue, 8 May 2012 16:41:12 +0200,
Giuseppe Condorelli <giuseppe.condorelli@gmail.com> a =E9crit :
> as you have understood from my previous requests, I'm a newbe of OE-Core
> and I'm wondering
> which is the better way to build a toolchain sdk.
> I'm understanding it's different respect the classic openembedded tree
> (where I was able to build it).
> Please can you help me?
>=20
you can try :
bitbake meta-toolchain
or for qt embedded :
bitbake meta-toolchain-qte

Eric


