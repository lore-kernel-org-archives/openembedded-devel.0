Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NemNX-00056f-SK
	for openembedded-devel@openembedded.org; Tue, 09 Feb 2010 10:27:34 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 431B41D360E2; Tue,  9 Feb 2010 10:24:59 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2010 10:24:58 +0100
Message-Id: <1265707499-32190-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
References: <201002091003.19947.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH v2] linux 2.6.24: moving ts72xx to 2.6.27 as default kernel so change DEFAULT_PREFERENCE
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
X-List-Received-Date: Tue, 09 Feb 2010 09:27:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/linux/linux_2.6.24.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.b=
b
index 31a8a04..8d53999 100644
--- a/recipes/linux/linux_2.6.24.bb
+++ b/recipes/linux/linux_2.6.24.bb
@@ -7,7 +7,6 @@ DEFAULT_PREFERENCE_mpc8313e-rdb =3D "1"
 DEFAULT_PREFERENCE_simpad =3D "1"
 DEFAULT_PREFERENCE_atngw100 =3D "1"
 DEFAULT_PREFERENCE_at32stk1000 =3D "1"
-DEFAULT_PREFERENCE_ts72xx =3D "1"
 DEFAULT_PREFERENCE_hipox =3D "1"
 DEFAULT_PREFERENCE_cs-e9302 =3D "1"
 DEFAULT_PREFERENCE_smartq5 =3D "1"
--=20
1.5.6.5



