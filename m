Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OlMGq-0007HD-Uz
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 15:32:25 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlMGO-0003Ke-0J from Fahad_Usman@mentor.com ;
	Tue, 17 Aug 2010 06:31:36 -0700
Received: from 137.202.157.210 ([137.202.157.210]) by eu2-mail.mgc.mentorg.com
	([137.202.76.30]) via Exchange Front-End Server
	webmail.mentor.com ([192.94.38.218]) with Microsoft Exchange
	Server HTTP-DAV ; Tue, 17 Aug 2010 13:31:34 +0000
Received: from pkl-fusman-ubuntu by webmail.mentor.com;
	17 Aug 2010 18:34:19 +0500
From: Fahad <Fahad_Usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Organization: Mentor Graphics
Date: Tue, 17 Aug 2010 18:34:18 +0500
Message-ID: <1282052058.27679.141.camel@pkl-fusman-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh-native: Removed legacy style staging
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
X-List-Received-Date: Tue, 17 Aug 2010 13:32:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> 2010/8/17 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:=20
>=20
>=20
> I think you need
> NATIVE_INSTALL_WORKS =3D "1"
> in your recipe.
>=20
> When updating your patch please resubmit as v2 and update patchwork
>=20
> Frans
>=20

I am getting the same .pkg file and staging directory both with or
without the NATIVE_INSTALL_WORKS =3D "1" line, should i still add it and
update the patch?

Thanks,
Fahad


