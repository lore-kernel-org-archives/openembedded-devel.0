Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D2D5B6A9B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 18:07:29 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so6733279pdj.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=tK2vkCXNaGfccZbNv+6S8EN9JKNwLwgjZF6As+y6jdQ=;
	b=z+L+iH8wY85lD+IKMumYHK+hAfIh13IYC5oM3bhfddOs2EtdKwDChoN4K00+Cbwokb
	xEeouRHeaoeucikE0A4OkbrQROOxtxZtjqyATWaC/s2aEdUBllcKwCi5v3M8mqA7wjcX
	hhMC71Og8/1U1ng48bZGgCgke1QQI87n3rhDyoI7bifBDNbm4pI9G3vR12Ffb/3y8tKm
	lukYzpfIvvMoikDOda9O/Z85GE7CsJkBN2Ohe+zQZPctRdSwxvUfW238rBWn8u3ibdbc
	EQ1UDREcP/GfY4mA7Yc07wdNSscqA4c6olfJtg9+FilRnPiSSrTQC0d/MW9SrivE+Y3c
	UwTg==
X-Received: by 10.68.106.196 with SMTP id gw4mr20969047pbb.126.1371060450917; 
	Wed, 12 Jun 2013 11:07:30 -0700 (PDT)
Received: from sa-nc-common3-188.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	xj9sm13525774pbc.16.2013.06.12.11.07.28 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 11:07:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jun 2013 11:07:29 -0700
Message-Id: <6AAD285D-7739-4A3D-A4F6-2DC26F5902D1@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Riku Voipio <riku.voipio@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
X-Mailer: Apple Mail (2.1508)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: meta-linaro README info on sending patches
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
X-List-Received-Date: Wed, 12 Jun 2013 18:07:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Marcin,Riku

The linaro OE layers need updating the README files reflecting some of =
the essential fields. Maintainers and where the upstream patches
are sent to and any other relevant information thats needed in patches =
for linaro layers, current README is at top of meta-linaro which is fine
however the meta-aarch64 and meta-linaro-toolchain also need there =
READMEs detailing on how to use these layers in conjunction with OE
universe. See the READMEs of some of layers under meta-openembedded =
umbrella for guidelines and http://openembedded.org/wiki/Layers_FAQ
especially where it describes the need for README and its contents

Thanks
-Khem=20=

