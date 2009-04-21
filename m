Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LwMUc-0003Jb-9e
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 22:22:58 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LwMQG-0004NY-To
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 00:18:29 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 00:18:28 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1238173051-2118-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1238173051-2118-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904220018.28386.khimov@altell.ru>
Subject: Re: [PATCH] dialog: update version 1.0-20050306 -> 1.1-20080819
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
X-List-Received-Date: Tue, 21 Apr 2009 20:22:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 27 March 2009 19:57:31 Roman I Khimov wrote:
>  conf/checksums.ini                                 |    6 +-
>  recipes/dialog/dialog-1.0-20050306/configure.patch |   37 -
>  recipes/dialog/dialog-1.0-20050306/m4.patch        | 6979
> -------------------- recipes/dialog/dialog-1.0-20050306/templates.patch |  
> 25 -
>  recipes/dialog/dialog-static_1.0-20050306.bb       |    4 -
>  recipes/dialog/dialog-static_1.1-20080819.bb       |    3 +
>  recipes/dialog/dialog.inc                          |    9 +-
>  recipes/dialog/dialog_1.1-20080819.bb              |    1 +
>  8 files changed, 12 insertions(+), 7052 deletions(-)
>  delete mode 100644 recipes/dialog/dialog-1.0-20050306/configure.patch
>  delete mode 100644 recipes/dialog/dialog-1.0-20050306/m4.patch
>  delete mode 100644 recipes/dialog/dialog-1.0-20050306/templates.patch
>  delete mode 100644 recipes/dialog/dialog-static_1.0-20050306.bb
>  create mode 100644 recipes/dialog/dialog-static_1.1-20080819.bb
>  create mode 100644 recipes/dialog/dialog_1.1-20080819.bb

ping


