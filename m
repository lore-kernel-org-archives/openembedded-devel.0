Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1Ih8ZJ-0000Qs-Vs
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Oct 2007 20:52:06 +0200
Received: from [192.168.1.64] ([::ffff:78.86.130.156])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Sun, 14 Oct 2007 19:45:47 +0100
	id 0006400B.471263DB.00004036
Message-ID: <471263F8.30501@xora.org.uk>
Date: Sun, 14 Oct 2007 19:46:16 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.6 (X11/20070824)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1Ih50c-0005Xz-Bs@linuxtogo.org>
In-Reply-To: <E1Ih50c-0005Xz-Bs@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev libid3tag: update to 0.15.1b, fix SRC_URI - close #3147
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Oct 2007 18:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

eha commit wrote:
> -SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz "
> +SRC_URI = "http://downloads.sourceforge.net/mad/libid3tag-${PV}.tar.gz"
>  S = "${WORKDIR}/libid3tag-${PV}"
>  
>   
Same with this shouldnt it be ${SOURCEFORGE_MIRROR}

Graeme



