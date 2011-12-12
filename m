Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaAak-0002mg-Li
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 19:27:10 +0100
Received: by bkbzt4 with SMTP id zt4so5583427bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=YfWbLja4P64PvanKRzcCnV238HdbmsKPrXWUOcNFL+I=;
	b=TenS9fQmUf+KqSP+wH40BM1HfiPi1xtCrwpiOfPPK3IkqOFaOaUui9M2N/FyewPkAo
	UWxW09+PK/TxhUWuFP1fsKZh0sy7v/FOOzXmiHfjfVpxquU6/MfQpGVGn+v5x01bXQjd
	D4AmUqFEqIvVwE/eVQkxyD39A0HL1CcZGufiI=
MIME-Version: 1.0
Received: by 10.205.139.7 with SMTP id iu7mr10852083bkc.83.1323714006217; Mon,
	12 Dec 2011 10:20:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Mon, 12 Dec 2011 10:20:06 -0800 (PST)
In-Reply-To: <cover.1323713870.git.otavio@ossystems.com.br>
References: <cover.1323713870.git.otavio@ossystems.com.br>
Date: Mon, 12 Dec 2011 16:20:06 -0200
X-Google-Sender-Auth: hI4D85kc-dLkLgFCkCgGrpowSfU
Message-ID: <CAP9ODKphBDK_nYbK69kCJ6gVPWNvnMx1UGuDsffgNi=6EDkLKA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 0/2] Misc
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
X-List-Received-Date: Mon, 12 Dec 2011 18:27:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ignore this mail plz.

On Mon, Dec 12, 2011 at 16:18, Otavio Salvador <otavio@ossystems.com.br>wrote:

> The following changes since commit
> 7ad9db8b3b6dd8fb9f85032b02344036015a9698:
>
>  gnome-panel : Fix format of LICENSE field. (2011-12-12 18:45:06 +0100)
>
> are available in the git repository at:
>  git://github.com/OSSystems/meta-oe master
>  https://github.com/OSSystems/meta-oe/tree/master
>
> Otavio Salvador (2):
>  connman: convert to bbappend as 0.78 has been moved to OE-Core
>  dropbear: convert PR to use PRINC on bbappend
>
>  meta-oe/recipes-connectivity/connman/connman.inc   |   98
> --------------------
>  .../recipes-connectivity/connman/connman/connman   |   42 ---------
>  .../recipes-connectivity/connman/connman_0.78.bb   |   33 -------
>  .../connman/connman_0.78.bbappend                  |   13 +++
>  .../dropbear/dropbear_2011.54.bbappend             |    2 +-
>  5 files changed, 14 insertions(+), 174 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/connman/connman.inc
>  delete mode 100755 meta-oe/recipes-connectivity/connman/connman/connman
>  delete mode 100644 meta-oe/recipes-connectivity/connman/connman_0.78.bb
>  create mode 100644
> meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
>
> --
> 1.7.2.5
>
>


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

