Return-Path: <diego.ml@zoho.com>
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id 48E12601F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 10:21:36 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:user-agent:in-reply-to:references:mime-version:content-type;
	b=FUNEIY3Ze902jqzGEJmaB1eVmnYmQ8jL2ugCkzE/2T9xpPeXz3RUvL52rYp5GSvt3CIvXEpjiN1u
	jdtzbvdEVIAXoBj8BK7RlHCRNyI4Nc4uxgMeafK5FcDa+FE7qBFm  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1455877297165543.3442772338939;
	Fri, 19 Feb 2016 02:21:37 -0800 (PST)
From: Diego <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Feb 2016 11:21:33 +0100
Message-ID: <30335169.acMkHNbZIK@localhost.localdomain>
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <1455816195-23164-1-git-send-email-diego.ml@zoho.com>
References: <1455816195-23164-1-git-send-email-diego.ml@zoho.com>
MIME-Version: 1.0
X-Zoho-Virus-Status: 1
Subject: Re: [meta-oe][PATCH] webmin: adjust mysql module default config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2016 10:21:37 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

In data gioved=EC 18 febbraio 2016 17:23:15, Diego Rondini ha scritto:
> Default config of the mysql Webmin module uses paths of a manually in=
stalled
> MySQL. This commit adjusts paths to the ones used by MariaDB in OE.
>=20

Please disregard this version of the patch, patch is for meta-webserver=
 as=20
done in PATCH v2, not for meta-oe.

Sorry,
Diego


