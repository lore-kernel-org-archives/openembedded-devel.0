Received: from [64.233.162.233] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1GrcQo-0001dA-2m
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Dec 2006 16:42:06 +0100
Received: by nz-out-0102.google.com with SMTP id m22so1989386nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2006 07:41:12 -0800 (PST)
Received: by 10.78.201.2 with SMTP id y2mr9084595huf.1165333271124;
	Tue, 05 Dec 2006 07:41:11 -0800 (PST)
Received: by 10.78.166.11 with HTTP; Tue, 5 Dec 2006 07:41:11 -0800 (PST)
Message-ID: <d46153c40612050741h4710f432yd984fb92e57fa931@mail.gmail.com>
Date: Tue, 5 Dec 2006 09:41:11 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45758A01.1030203@linuxdevelopment.de>
MIME-Version: 1.0
References: <d46153c40612041402o2e1ed6fdmdd1a8fa8261d15ce@mail.gmail.com>
	<432beae0612050150u64499772m14fefdeb8ccd6e2f@mail.gmail.com>
	<d46153c40612050629v8bdfcd2i32fa9858f916605f@mail.gmail.com>
	<45758A01.1030203@linuxdevelopment.de>
Subject: Re: madwifi
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
X-List-Received-Date: Tue, 05 Dec 2006 15:42:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 12/5/06, Robert W=F6rle <robert@linuxdevelopment.de> wrote:
> Dear Andrew
>
> Is there a specific reason why you work with the .oz354 tree ?
> This tree is old and i think not maintained anymore ,, ( people correct
> me if am wrong )
>
> Also that you miss tmp/work/ARCHITECURE directory tells me that you
> should consider a
> mtn update in order to sync your tree to the current state .. then
> please use .dev tree .
>
> btw : how is your compulab ?  we also evaluate it here and i am getting
> good results also using the current .dev tree

Our Compulab board is working very well so far, I just got the LCD up
and running yesterday and I'll add a touch screen today.  And
hopefully wifi support :)

I am NOT using .oz354, I am using org.openembedded.dev, sorry for the mista=
ke.


