Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1IZtUs-0002oV-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2007 21:21:34 +0200
Received: by nz-out-0506.google.com with SMTP id i11so959140nzh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 12:17:13 -0700 (PDT)
Received: by 10.142.12.14 with SMTP id 14mr1772026wfl.1190661433174;
	Mon, 24 Sep 2007 12:17:13 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Mon, 24 Sep 2007 12:17:13 -0700 (PDT)
Message-ID: <a7f8874a0709241217o1fbd6060ka53b75837e07be78@mail.gmail.com>
Date: Mon, 24 Sep 2007 12:17:13 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
MIME-Version: 1.0
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: RFC: Kexec Cmdline Support
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
X-List-Received-Date: Mon, 24 Sep 2007 19:21:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(sorry for crossposting this,but I think more of the interested parties read
oe-devel then angstrom-devel)

A while back, mwester made some patches to add the ability to modify the
cmdline when using kexec to load a kernel. I did some testing on poodle and
posted the results on the bug tracker
(http://bugs.openembedded.org/show_bug.cgi?id=2969)
I was wondering what the rest of the developers think of these. I would like
to see them incoprorated in one way or another, since this will allow us to
support booting a root-fs directly from the SD card. This is especially
important for flash-challenged devices (collie, poodle, sl-c700) but also
makes testing new images much simpler.

Thank you for your time,

Henry von Tresckow (hvontres)

