Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4oSd-0006iS-CZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 03:15:03 +0100
Received: by fg-out-1718.google.com with SMTP id 22so399619fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2007 18:10:05 -0800 (PST)
Received: by 10.86.91.12 with SMTP id o12mr8346491fgb.55.1198030205493;
	Tue, 18 Dec 2007 18:10:05 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id y18sm9732750fkd.2007.12.18.18.10.03
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2007 18:10:03 -0800 (PST)
Date: Wed, 19 Dec 2007 04:15:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <176245261.20071219041526@gmail.com>
To: Grant Edwards <grante@visi.com>
In-Reply-To: <fk9sme$nsr$1@ger.gmane.org>
References: <fk9sme$nsr$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Confusing wording on GettingStarted page
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
X-List-Received-Date: Wed, 19 Dec 2007 02:15:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Grant,

Wednesday, December 19, 2007, 3:38:23 AM, you wrote:

> There is some confusing wording on the GettingStarted Wiki
> page.  I tried to figure out how to get an account so I could
> fix it, but was unable to.

  Did you try "Edit" tab? ;-)

> The issue is that there are places where a Monotone workspace
> is referred to as a "database".  A Monotone database is
> something completely separate from a workspace.  For example in
> the "Updating OE" it says

>    Then update the branch(es) you are using. This will update the
>    contents of the files in the local database. For example:

>      $ cd /stuff/org.openembedded.dev && mtn update
>      $ cd /stuff/org.openembedded.dreambox && mtn update

> The commands are correct, but they're not updating the local
> database (which is a file typically name OE.mtn), they're
> updating two local workspaces.




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



