# Multichannel Audio Routing in Ableton Live

Live's ordinary track path is stereo. **s3g Bus Send 36** and **s3g Bus
Receive 36** provide an explicit, numbered 36-channel connection between
tracks. The same bus works for Ambisonics and other multichannel layouts.
The **s3g Ambi …** wrappers do not contain hidden bus connections: put Send
and Receive devices wherever the signal crosses a track boundary.

## Send stereo into a multichannel encoder

This example feeds **s3g Ambi Encoder Path** from a stereo source.

1. On the source track, put **s3g Bus Send 36** after the stereo source.
   Set **INPUT = STEREO 2**, **CH = 2**, **SLOT = 01**, and **BUS = 01**.
   Choose **DRY KEEP** if the source should also play on its own track, or
   **BUS ONLY** if it should not.

   ![s3g Bus Send 36 in Live set to send two stereo source channels on audio bus 01](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/bus-send-36-stereo-to-01.png)

2. On a separate audio track, put **s3g Bus Receive 36** immediately before
   **s3g Ambi Encoder Path**. Set **BUS = 01**. Leave **MON = OFF** for a
   bus-only track.

The Receive publishes its channels to the next device on that track. The
encoder's output also moves to the next device on the same track
automatically; no **NEXT** switch is required.

## Send the encoded field to a decoder track

3. After the encoder, add another **s3g Bus Send 36**. Select
   **INPUT = CHAIN 36**, **CH = 36**, **SLOT = 01**, and **BUS = 02**.

   ![Encoder track in Live: Bus Receive 36 on bus 01, Ambi Encoder Path, then Bus Send 36 carrying chain channels 01–36 on bus 02](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/receive-ambi-path-send-36-chain.png)

   ![Bus Send 36 after the encoder set to CHAIN 36, CH 36, and SND BUS 02](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/bus-send-36-chain-to-02.png)

   For this stereo-source example, set Path's **INPUTS = 2** in its editor.
   Set **ORDER = 5OA** to produce 36 active Ambisonic channels. The Send's
   **CH = 36** transports those slots; it does not set the encoder's order.
   See the [Path plugin controls](https://s3g.github.io/s3g-dsp/ambi-encoder-path.html)
   for other input counts and orders.

   ![Ambi Encoder Path editor controls showing ORDER 5OA and INPUTS 2](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/ambi-encoder-path-5oa-controls.png)

   [View the complete Ambi Encoder Path editor](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/ambi-encoder-path-editor-5oa-inputs-2.png).
4. On the decoder track, put **s3g Bus Receive 36** (**BUS = 02**) before a
   compatible decoder, such as **s3g Ambi Decoder Speaker**.

   ![Live device chain with Bus Receive 36 on bus 02, Ambi Decoder Speaker, and Main Hardware Out 32](https://raw.githubusercontent.com/s3g/s3g-clap-max/main/package/docs/images/screenshots/receive-decoder-main-chain.png)

Use a new bus number after the encoder because Bus 01 carries the stereo
source and Bus 02 carries the encoded field. Multiple Sends may feed one
audio bus; their channels are summed at its Receive. Use one Receive
destination per audio bus number. For further cross-track effects, add a
new Send/Receive pair on another bus. For an effect on the same track,
simply place it between the encoder and Send.

The bus holds 36 channels, enough for fifth-order Ambisonics. A CLAP may
offer higher orders, but channels above 36 do not cross this bus. Set Send's
**CH** to the active output count for smaller formats; selecting **CH = 36**
in this example carries all available encoder slots, including silence in
unused slots.

The Receive's **MON** menu auditions a stereo pair through the track's
ordinary output. It does not change the multichannel signal passed to the
next device. Set it back to **OFF** when you do not want that monitor path.

After a multichannel decoder or panner, continue to
[Main Hardware Output](https://github.com/s3g/s3g-clap-max/wiki/Main-Hardware-Output). Stereo decoders instead
return to Live's normal stereo output.
