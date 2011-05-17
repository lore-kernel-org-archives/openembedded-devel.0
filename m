Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QMJsX-0002s1-8q
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 15:00:01 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QMJpk-0002MO-TO from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 05:57:09 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 17 May 2011 14:57:05 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A505BF0F8F@eu2-mail.mgc.mentorg.com>
In-Reply-To: <20110517124220.GB11317@jama.jama.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH v2] Add new recipe for 0.5.4 version.
Thread-Index: AcwUj/aVdr/aHxLpRkOPWLr5XC8JRwAAdZkA
References: <1305635011-6171-1-git-send-email-noor_ahsan@mentor.com>
	<20110517124220.GB11317@jama.jama.net>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] Add new recipe for 0.5.4 version.
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
X-List-Received-Date: Tue, 17 May 2011 13:00:01 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Yeah, I missed the recipe/package name in the subject. I am sending
another patch.

Regards,
Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Martin Jansa
Sent: Tuesday, May 17, 2011 5:42 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH v2] Add new recipe for 0.5.4 version.

On Tue, May 17, 2011 at 05:23:31PM +0500, Noor Ahsan wrote:
> * Added a new recipe for 0.5.4 version
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>

Commit message should start with package_name:

from "Add new recipe for 0.5.4 version." in Subject I have no idea what
are you talking about and have to open e-mail body.. which is not that
bad as displaying whole commit if it gets commited :).

Regards,

> ---
>  recipes/lttng/userspace-rcu_0.5.4.bb |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/lttng/userspace-rcu_0.5.4.bb=20
> b/recipes/lttng/userspace-rcu_0.5.4.bb
> new file mode 100644
> index 0000000..e0d98e5
> --- /dev/null
> +++ b/recipes/lttng/userspace-rcu_0.5.4.bb
> @@ -0,0 +1,3 @@
> +require ${PN}.inc
> +SRC_URI[md5sum] =3D "04147d24749be75200173859839207f7"
> +SRC_URI[sha256sum] =3D
"02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4eb28948e234bd89f1"
> --
> 1.6.3.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


