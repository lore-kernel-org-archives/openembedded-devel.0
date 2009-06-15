Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGGF5-000296-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 19:45:11 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA00797JHZ6E10@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 10:34:55 -0700 (PDT)
Message-id: <A53836B7-5B08-42CA-A09B-EABF97DC52D0@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
Date: Mon, 15 Jun 2009 21:34:38 +0400
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
	<c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
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
X-List-Received-Date: Mon, 15 Jun 2009 17:45:11 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	When building the FANN library, I get the following message:

NOTE: Multiple libraries (libfann.so.2, libdoublefann.so.2,  
libfixedfann.so.2, libfloatfann.so.2) found and LEAD_SONAME not defined

What is the use of the LEAD_SONAME?

What should I do to make this recipe better and fix the following  
messages:

NOTE: Not creating empty archive for libfann-doc-2.0.0-r01.2
NOTE: Not creating empty archive for libfann-locale-2.0.0-r01.2


Best regards,

Elvis



