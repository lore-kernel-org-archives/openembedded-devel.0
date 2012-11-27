Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TdTS5-0000s7-Dy
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 23:16:27 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qARM292R002103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 14:02:09 -0800 (PST)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.156]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0318.004;
	Tue, 27 Nov 2012 14:02:08 -0800
From: "Gherzan, Andrei" <Andrei.Gherzan@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][meta-systemd][PATCH] dhcp: Sync bbappend
	version with the one from oe-core
Thread-Index: AQHNy/KD8QYYcJsV60evS9eMfkWFQpf+DDcAgAAxRrg=
Date: Tue, 27 Nov 2012 22:02:08 +0000
Message-ID: <8A4F3EB72242474193467105FE61962920213F72@ALA-MBB.corp.ad.wrs.com>
References: <1353947056-2799-1-git-send-email-andrei.gherzan@windriver.com>,
	<20121127110442.GA3692@jama.jama.net>
In-Reply-To: <20121127110442.GA3692@jama.jama.net>
Accept-Language: en-US, ro-RO
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.18.27]
MIME-Version: 1.0
Subject: Re: [meta-oe][meta-systemd][PATCH] dhcp: Sync bbappend version with the one from oe-core
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
X-List-Received-Date: Tue, 27 Nov 2012 22:16:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Great. Waiting for merge.
________________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Tuesday, November 27, 2012 1:04 PM
To: openembedded-devel@lists.openembedded.org
Cc: Gherzan, Andrei
Subject: Re: [oe] [meta-oe][meta-systemd][PATCH] dhcp: Sync bbappend versio=
n with the one from oe-core

On Mon, Nov 26, 2012 at 06:24:16PM +0200, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  .../dhcp/dhcp_4.2.4-P1.bbappend                    |   13 -------------
>  .../dhcp/dhcp_4.2.4-P2.bbappend                    |   13 +++++++++++++
>  2 files changed, 13 insertions(+), 13 deletions(-)
>  delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4=
.2.4-P1.bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4=
.2.4-P2.bbappend

Looks the same as:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/04244=
8.html

except sent without -M and not moving to oe-core prefix like mine does.

Cheers,

--
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


