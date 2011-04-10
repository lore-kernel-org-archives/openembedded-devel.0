Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Q8rE5-0000M4-FQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 11:46:53 +0200
Received: from [192.168.2.15] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id CE5D1A64EC;
	Sun, 10 Apr 2011 11:43:46 +0200 (CEST)
Message-ID: <4DA17BD1.8050500@eukrea.com>
Date: Sun, 10 Apr 2011 11:43:45 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.9
MIME-Version: 1.0
To: Tom Rini <tom_rini@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [2011.03-maintenance] cherry-pick request
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
X-List-Received-Date: Sun, 10 Apr 2011 09:46:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom,

is it possible to cherry-pick the following commits to 2011.03-maintenance.
They are part of your fixes for patches with ".." in path but only the ones 
for tcl/tk were merged into 2011.03-maintenance branch, thus for example db5 
fails to compile on a Fedora 14.

4adee396bf2eaf0cb52f5914302b7789270a4080
12b24f2598cebf8fd18f2f15cf68abf229ddf6eb
3c90f4773accbde5c30c9f0b4ab39245b0094504
f0bb74cccdff4c63cdef5416cbe25360d35ee12c
31adccabfaeb234cb69cb029e090b0ec47a96f5d
6f64c786d3d47ccc24439d86ca02b6ee77c2f603
43bb129434f6007a7003c6472675d625bb63bd76
ed3b755c62c6b353268a48b8c1a2becc26513752
bcb14fc7adb1fa817e624421a91b2d11d3b107b8
fe0d72d2fabde47af3aaeeb4158672ff0e23d705
44abf99ecfd45c739508a4be5af45da797c859dd
3fb654d5a9bd62a258eeb8f77178653948897b10
de753f3bef4b30c1d1dafb78e2d8282d6f415298
35672befc2752f3bd84b0d5369a2c006dfb744a4

Thanks
Eric


