Received: from [17.148.16.88] (helo=asmtpout013.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI7Ds-0000WV-Hu
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 22:31:36 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp013.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00DKN0HZN660@asmtp013.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 13:20:28 -0700 (PDT)
Message-id: <ADFDB08F-9C2B-4156-8FE2-48C9C53DA921@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245527560.29153.295.camel@lenovo.internal.reciva.com>
Date: Sun, 21 Jun 2009 00:20:07 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
	<3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
	<1245523070.29153.290.camel@lenovo.internal.reciva.com>
	<B7C10C35-361B-469B-975E-B80AA8B7ED6A@mac.com>
	<1245527560.29153.295.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 20:31:36 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	My only gripe with this autotools_stage, is that all the headers just  
go flat under

/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include

instead of nicely packaging it under a libserial folder within /tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include

Anyway to fix this?


Best regards,

Elvis


