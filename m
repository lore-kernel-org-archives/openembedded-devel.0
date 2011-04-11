Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q9JpH-0005Oy-7b
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 18:18:55 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q9Jn6-0007Lr-PN from Tom_Rini@mentor.com ;
	Mon, 11 Apr 2011 09:16:40 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 11 Apr 2011 09:14:06 -0700
Received: from [172.30.80.119] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 11 Apr 2011 09:16:40 -0700
Message-ID: <4DA32969.3080902@mentor.com>
Date: Mon, 11 Apr 2011 09:16:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <4DA17BD1.8050500@eukrea.com>
In-Reply-To: <4DA17BD1.8050500@eukrea.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 11 Apr 2011 16:14:06.0255 (UTC)
	FILETIME=[7B3283F0:01CBF863]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] cherry-pick request
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
X-List-Received-Date: Mon, 11 Apr 2011 16:18:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

On 04/10/2011 02:43 AM, Eric Bénard wrote:
> Hi Tom,
> 
> is it possible to cherry-pick the following commits to 2011.03-maintenance.
> They are part of your fixes for patches with ".." in path but only the
> ones for tcl/tk were merged into 2011.03-maintenance branch, thus for
> example db5 fails to compile on a Fedora 14.
> 
> 4adee396bf2eaf0cb52f5914302b7789270a4080
> 12b24f2598cebf8fd18f2f15cf68abf229ddf6eb
> 3c90f4773accbde5c30c9f0b4ab39245b0094504
> f0bb74cccdff4c63cdef5416cbe25360d35ee12c
> 31adccabfaeb234cb69cb029e090b0ec47a96f5d
> 6f64c786d3d47ccc24439d86ca02b6ee77c2f603
> 43bb129434f6007a7003c6472675d625bb63bd76
> ed3b755c62c6b353268a48b8c1a2becc26513752
> bcb14fc7adb1fa817e624421a91b2d11d3b107b8
> fe0d72d2fabde47af3aaeeb4158672ff0e23d705
> 44abf99ecfd45c739508a4be5af45da797c859dd
> 3fb654d5a9bd62a258eeb8f77178653948897b10
> de753f3bef4b30c1d1dafb78e2d8282d6f415298
> 35672befc2752f3bd84b0d5369a2c006dfb744a4

I'd like for someone else to do the pick, confirm it works and send a
pull request for that tree rather than doing the picking myself.  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


