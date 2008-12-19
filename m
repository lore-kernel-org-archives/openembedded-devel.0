Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDX6u-0005zT-7P
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 05:37:12 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LDX2C-0000jz-VL for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 12:32:32 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDX2c-0007t9-Al
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 12:32:46 +0800
Date: Fri, 19 Dec 2008 12:32:46 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081219043245.GN2135@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20081218161337.32EA0189349@amethyst.openembedded.net>
	<494A8809.502@gmx.net>
MIME-Version: 1.0
In-Reply-To: <494A8809.502@gmx.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: [oe-commits] John Lee : om-gta02.conf: bring over this	conf from om.dev
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
X-List-Received-Date: Fri, 19 Dec 2008 04:37:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I just shot myself in the foot do I?

(checking everything over again...)


- John

On Thu, Dec 18, 2008 at 06:27:37PM +0100, Robert Schuster wrote:
> Hi,
> 
> GIT User account schrieb:
> >  TARGET_ARCH = "arm"
> > -MACHINE_CLASS = "neo1973"
> > -PACKAGE_EXTRA_ARCHS = "fic-gta02 ${MACHINE_CLASS}"
> > +PACKAGE_EXTRA_ARCHS = "armv4t"
> Something may be missing. When the change is applied I cannot build
> anything because I get an error from the sanity checker:
> 
> ERROR:  Openembedded's config sanity checker detected a potential
> misconfiguration.
> 	Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
> 	Following is the list of potential problems / advisories:
> 
> 	Error, Your PACKAGE_ARCHS field contains duplicates. Perhaps you set
> EXTRA_PACKAGE_ARCHS twice accidently through some tune file?
> 
> 
> Regards
> Robert
> 



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



