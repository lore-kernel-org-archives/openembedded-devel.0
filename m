Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGPT8-0000aS-IB
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 05:36:18 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLB00460AV6ZY00@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 20:25:59 -0700 (PDT)
Message-id: <BA30CC78-BC16-4681-A750-C964E6E32CE1@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245091999.29153.48.camel@lenovo.internal.reciva.com>
Date: Tue, 16 Jun 2009 07:25:45 +0400
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
	<c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
	<A53836B7-5B08-42CA-A09B-EABF97DC52D0@mac.com>
	<1245088339.29153.39.camel@lenovo.internal.reciva.com>
	<4A3695E3.9070500@balister.org>
	<1245091999.29153.48.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Help required to create recipe for FANN library
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
X-List-Received-Date: Tue, 16 Jun 2009 03:36:18 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		
On Jun 15, 2009, at 10:53 PM, Phil Blundell wrote:

>
> Right now, I think the only way is to do it by steam, something like:
>
> PACKAGES =+ "libfann libdoublefann libfixedfann libfloatfann"
> FILES_libfann = "${libdir}/libfann${SOLIBS}"
> FILES_libdoublefan = "${libdir}/libdoublefan${SOLIBS}"
> ...

I did as you suggested but get the following errors:

  -------------------
ERROR: libfann is listed in PACKAGES multiple times, this leads to  
packaging errors.
ERROR: Please fix the metadata/report this as bug to OE bugtracker.
ERROR: -------------------



Best regards,

Elvis


