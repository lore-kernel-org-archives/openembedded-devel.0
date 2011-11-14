Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RQ1n5-0005SJ-Ly for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 20:01:59 +0100
Received: by wwp14 with SMTP id 14so4597485wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:55:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.208.147 with SMTP id gc19mr16600646wbb.25.1321296937846;
	Mon, 14 Nov 2011 10:55:37 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Mon, 14 Nov 2011 10:55:37 -0800 (PST)
Date: Mon, 14 Nov 2011 12:55:37 -0600
Message-ID: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 19:02:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am getting a gcc error

cc1: error: -Werror=unused-but-set-variable: No option -Wunused-but-set-variable

Using the Angstrom scripts I can run machine=beagleboard and complete.
However, machine=cm-t35 with a cm-t35.conf file throws this error.

I am having to guess that the machine file is all that was required,
it seems to pich all the right arch, etc.

I had asked on Angstrom for any CM-T35 related info to no avail...

-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


