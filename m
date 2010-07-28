Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1OeDKy-0000pP-UY
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 22:35:39 +0200
Received: by qwg8 with SMTP id 8so1169293qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 13:34:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.79.83 with SMTP id o19mr8869634qak.200.1280349269659; Wed, 
	28 Jul 2010 13:34:29 -0700 (PDT)
Received: by 10.229.251.195 with HTTP; Wed, 28 Jul 2010 13:34:28 -0700 (PDT)
Date: Wed, 28 Jul 2010 13:34:28 -0700
Message-ID: <AANLkTiki-zNM94gkoFf+WaMtWfnvpr=Pw-Y0sOSBqBAo@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: sending output from a command to the console
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
X-List-Received-Date: Wed, 28 Jul 2010 20:36:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there anyway to stop directing the output (of commands in a task) from
being directed to the log file and send it to the standard output?

I have a situation where after the image is built I want to have oe to
automatically down load the image to our hardware. the program that does the
download asks the caller to push a button on our box before the
download precedes.  I'd like to have its output not logged but rather sent
to the console.

Mike

