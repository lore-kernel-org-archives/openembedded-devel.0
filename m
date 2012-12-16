Received: from p3plsmtpa01-09.prod.phx3.secureserver.net ([72.167.82.89])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1TkIPz-0005HN-VA
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 18:54:28 +0100
Received: (qmail 17277 invoked from network); 16 Dec 2012 17:33:08 -0000
Received: from unknown (66.41.60.82)
	by p3plsmtpa01-09.prod.phx3.secureserver.net (72.167.82.89) with ESMTP;
	16 Dec 2012 17:33:08 -0000
Message-ID: <50CE05D2.8050307@pabigot.com>
Date: Sun, 16 Dec 2012 11:33:06 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20121216105611.7746c440@eb-e6520>
In-Reply-To: <20121216105611.7746c440@eb-e6520>
Subject: Re: Denzil updates
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
X-List-Received-Date: Sun, 16 Dec 2012 17:54:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/16/2012 03:56 AM, Eric Bénard wrote:
> Hi Koen, Hi Liu,
>
> as per your requests the following patches were applied to
> denzil-next :
> 35f92b4 systemd: use system variables instead of hardcoded paths
> 6e0ddd4 systemd: update to v189 66e169f gdm: do not rely on
> dev-tty7.device
> 0f17a3f meta-systemd: systemd-systemctl-native: Also add support for
> WantedBy=*.service
> d6dd53c systemd-systemctl-native: handle ALIAS tag
> e5b3091 systemd-systemctl-native: extend systemctl wrapper to support
> mask action
> f713db3 systemd-systemctl-native: Add additional messages for better
> debugging
>
> patchwork # : 36615 36613 36609 36611 36605 36607 36535 (with manual
> rework for the last one).
>
> Please don't forget to cc me for patches for denzil or danny.

I thought that OE patch submission for any layer should follow the 
instructions in the README at the top of the layer being patched.

Those instructions already ask for "[danny]" (e.g.) to be part of the 
subject, and for submissions to be mailed to this list.  If this isn't 
enough and you should be cc'd specifically, can you add your preferred 
email address for these messages to the patch instructions?

I'll probably remember to look at the README, but I certainly won't 
remember other instructions that pass by on the mailing list like this.

Peter



