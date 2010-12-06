Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>)
	id 1PPjef-00034F-12; Mon, 06 Dec 2010 23:35:33 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:44434)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	id 1PPjdG-0000AQ-Eo (Exim 4.72)
	(return-path <jic23@cam.ac.uk>); Mon, 06 Dec 2010 22:34:06 +0000
Message-ID: <4CFD666A.7070100@cam.ac.uk>
Date: Mon, 06 Dec 2010 22:40:42 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101123 Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTik0zjtfygu8taBf_bUAdgu_yCtkH_1ZaKb5WX0+@mail.gmail.com>
In-Reply-To: <AANLkTik0zjtfygu8taBf_bUAdgu_yCtkH_1ZaKb5WX0+@mail.gmail.com>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 131.111.8.152
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembeded-users <Openembedded-users@lists.openembedded.org>
Subject: Re: [ANNOUNCE]: OpenEmbedded 2010.12 released
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
X-List-Received-Date: Mon, 06 Dec 2010 22:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/04/10 04:08, Khem Raj wrote:
> On behalf of OpenEmbedded Commmunity, I am excited to announce 2010.12
> release of OpenEmbedded.
> This release was focussed on stabilizing the metadata and getting
> various distro/machine/image
> combinations to work. A lot of effort was put by community to make
> this happen and a table of tested combination is available at
> 
> http://www.openembedded.org/index.php/Release-2010.12
> 
> In order to get the release using git
> 
> $ git clone git://git.openembedded.org/openembedded
> 
> $ cd openembedded
> 
> $ git checkout -b release-2010.12 release-2010.12
> 
> To download the release in form of tarballs
> 
> http://git.openembedded.org/cgit.cgi/openembedded/snapshot/release-2010.12.tar.bz2
> http://git.openembedded.org/cgit.cgi/openembedded/snapshot/release-2010.12.tar.gz
> 
> BIG thanks to everyone who tested different combinations, took part in
> stabilization effort, provided patches
> and provided feedback for the release to make it happen

Worth publicizing this a bit?  Perhaps send it to lwn and see if they
want to pick it up for their announcements page if someone hasn't done
it already?


