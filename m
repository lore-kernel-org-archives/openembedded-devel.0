Received: from [209.85.198.189] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1IumxN-0005tp-HE
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 11:37:21 +0100
Received: by rv-out-0910.google.com with SMTP id c24so1903385rvf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 02:35:05 -0800 (PST)
Received: by 10.140.179.25 with SMTP id b25mr2819877rvf.1195637586826;
	Wed, 21 Nov 2007 01:33:06 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.180.75])
	by mx.google.com with ESMTPS id 20sm62601nzp.2007.11.21.01.32.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Nov 2007 01:33:01 -0800 (PST)
Message-ID: <4743FB40.1030307@gmail.com>
Date: Wed, 21 Nov 2007 03:32:48 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: gfortran needed on host to compile gcc >= 4.1.2
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
X-List-Received-Date: Wed, 21 Nov 2007 10:37:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I took the liberty to enable gfortran for gcc_4.1.2 (hence gcc >= 4.1.2 
has fortran enabled). The side effect is that you need to install 
gfortran or g77 on your host to compile it.

Regards
Gordon


