Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KzDaJ-0004k5-74
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 17:56:23 +0100
Received: from 89-168-188-212.dynamic.dsl.as9105.com ([89.168.188.212]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KzDYY-0004Mj-Dn; Sun, 09 Nov 2008 16:54:35 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
Date: Sun, 09 Nov 2008 16:54:33 +0000
Message-Id: <1226249673.4235.671.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] checksums.ini: correct wrong checksums
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
X-List-Received-Date: Sun, 09 Nov 2008 16:56:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2008-11-09 at 16:28 +0300, Dmitry Baryshkov wrote:
>  [http://gpephone.linuxtogo.org/download/gpephone/libchenabler-0.1/libchenabler-0.1.tar.gz]
> -md5=f29e1e63fcc55e3ae4e81f5ee9dd7bdd
> -sha256=448a3ab76109664bb6bd8bcc2c62d957c7d44b52e39c37d91b3b73b5cfe35a3f
> +md5=866fd13611a8de946428db1df9be8468
> +sha256=74def55ba6a61e966e0873a4081fd3dd65089b94b837810d3bc056221d7e41c7

How did these wrong checksums get in there?  It seems to defeat the
point of checksums.ini if the data isn't trustworthy.

p.




