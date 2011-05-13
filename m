Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QKsJx-00051c-78
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 15:22:21 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 9CD50799015; Fri, 13 May 2011 15:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-188-060.pools.arcor-ip.net
	[88.71.188.60]) by gravedo.de (Postfix) with ESMTPSA id 0055E799010
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 15:19:33 +0200 (CEST)
Message-ID: <4DCD2FE5.6090801@gravedo.de>
Date: Fri, 13 May 2011 15:19:33 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105131210.17952.sgh@sgh.dk>
In-Reply-To: <201105131210.17952.sgh@sgh.dk>
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Fri, 13 May 2011 13:22:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 13.05.2011 12:10, S=F8ren Holm wrote:
>=20
> Hi
>=20
> Commit 5a6efd58cdc85d08ab9e106c84bbac5110b5aecd makes qt4 fail during c=
ompilation. It seems like qmake is not compiled or at least not staged.
> Adding DEPENDS +=3D "qt4-native" does not seem to help since qt4-native=
 is actually build.
>=20
> I've tried deleting tmp to get a fresh build but with no luck.

I tried compiling qt4-embedded multiply times before commiting the patch
mentioned above a never get in the situation you desribed. For which
machine and distro do you try to build qt4?

regards,
Simon


