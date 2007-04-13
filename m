Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <arkaitzj@gmail.com>) id 1HcJY3-00055k-76
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2007 13:02:35 +0200
Received: by an-out-0708.google.com with SMTP id c5so861039anc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2007 04:02:34 -0700 (PDT)
Received: by 10.100.94.3 with SMTP id r3mr2370273anb.1176462153999;
	Fri, 13 Apr 2007 04:02:33 -0700 (PDT)
Received: by 10.100.37.15 with HTTP; Fri, 13 Apr 2007 04:02:33 -0700 (PDT)
Message-ID: <7ceeaed30704130402p70faf470y94813b59ea40afee@mail.gmail.com>
Date: Fri, 13 Apr 2007 13:02:33 +0200
From: Arkaitz <arkaitzj@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Regexp substitution in a bb file
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
X-List-Received-Date: Fri, 13 Apr 2007 11:02:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I need to subsitute some things in the code of a package(coreutils)
and i don't know exactly where to put it.
My first choice is to create a do_configure () in the
coreutils_5.3.0.bb file that contains a
sed -i 's/__memcpy/memcpy/g' files* but i don't know if it is the best option.
Should i put it better in the coreutils.inc? and what is the do_configure for?
Thanks
-- 
Arkaitz


