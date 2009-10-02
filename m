Received: from [209.85.222.124] (helo=mail-pz0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1MtiNr-0004iA-1g
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 15:41:22 +0200
Received: by pzk30 with SMTP id 30so55902pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 06:40:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.74.8 with SMTP id w8mr334258wfa.192.1254490832897; Fri, 02 
	Oct 2009 06:40:32 -0700 (PDT)
Date: Fri, 2 Oct 2009 21:40:32 +0800
Message-ID: <fd72b8f50910020640i431e0b2cpae3b9816dd7e6184@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.124
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: 2.7.2 libxml2, libxml2-native not available
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
X-List-Received-Date: Fri, 02 Oct 2009 13:41:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I'm new to OE and I'm building console-image of openmoko from the latest git
source. There are some NOTEs here:

NOTE: Handling BitBake files: / (7315/7315) [100 %]
NOTE: Parsing finished. 0 cached, 7027 parsed, 288 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/libusb0 (libusb,
libusb-compat);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libusb0
NOTE: preferred version 2.7.2 of libxml2 not available (for item libxml2)
NOTE: preferred version 2.7.2 of libxml2 not available (for item libxml2)
NOTE: preferred version 2.7.2 of libxml2-native not available (for item
libxml2-native)
NOTE: preferred version 2.7.2 of libxml2-native not available (for item
libxml2-native)
NOTE: Preparing runqueue

The building process goes smoothly, but are there any problems about these
unavailable packages?
Thanks!

